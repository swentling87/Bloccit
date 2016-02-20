class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings
  has_many :commentlings, as: :commentable
  has_many :comments, through: :commentlings, dependent: :destroy
end
