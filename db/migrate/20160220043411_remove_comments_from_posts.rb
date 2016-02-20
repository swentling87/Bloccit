class RemoveCommentsFromPosts < ActiveRecord::Migration
  def up
    remove_index :comments, :topic_id
    remove_column :comments, :topic_id
    remove_index :posts, :post_id
    remove_column :posts, :post_id
  end
  def down
    add_column :comments, :topic_id, :integer
    add_index :comments, :topic_id
    add_column :posts, :post_id, :integer
    add_index :posts, :post_id
  end
end
