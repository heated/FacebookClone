class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  attr_accessible :body, :user_id, :post_id
  validates :body, :user_id, :post_id, :presence => true
end
