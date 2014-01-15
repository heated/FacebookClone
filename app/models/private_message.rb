class PrivateMessage < ActiveRecord::Base
  belongs_to :user_from
  belongs_to :user_to
  attr_accessible :body
end
