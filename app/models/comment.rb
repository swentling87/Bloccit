class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :topic
  belongs_to :user
  has_many :commentlings
  has_many :topics, through: :commentlings, source: :commentable, source_type: :Topic
  has_many :posts, through: :commentlings, source: :commentable, source_type: :Post 

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
end
