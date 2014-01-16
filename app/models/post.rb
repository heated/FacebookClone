class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user_id
  validates :body, :title, :user_id, :presence => true
  validates :title, :length => { :minimum => 8 }
  validates :body, :length => { :minimum => 30 }
  belongs_to :user
  has_many :comments,
           :include => :user
end
