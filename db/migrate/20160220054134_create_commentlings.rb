class CreateCommentlings < ActiveRecord::Migration
  def change
    create_table :commentlings do |t|
      t.references :comment, index: true

      t.references :commentable, polymorphic: true, index: true
      t.timestamps null: false
    end
    add_foreign_key :commentlings, :comments
  end
end
