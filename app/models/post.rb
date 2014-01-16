class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :title, :user_id
  validate :body, :title, :user_id, :presence => true
  validate :title, :length => { :minimum => 8 }
  validate :body, :length => { :minimum => 30 }
end
