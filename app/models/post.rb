class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :title, :user_id
  validate :body, :title, :user_id, :presense => true
end
