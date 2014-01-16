class PrivateMessage < ActiveRecord::Base
  belongs_to :user_from,
             :class_name => "User"
  belongs_to :user_to,
             :class_name => "User"
  attr_accessible :user_from_id, :user_to_id, :body
  validates :user_from_id, :user_to_id, :body, :presence => true
end
