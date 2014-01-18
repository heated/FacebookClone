class PrivateMessage < ActiveRecord::Base
  belongs_to :user_from,
             :class_name => "User"
  belongs_to :user_to,
             :class_name => "User"
  attr_accessible :user_from_id, :user_to_id, :body
  validates :user_from_id, :user_to_id, :body, :presence => true

  def to_builder
    Jbuilder.new do |message|
      message.(self, :id, :created_at, :updated_at, :body)
  
      message.user_from self.user_from.to_builder

      message.user_to self.user_to.to_builder
    end
  end
end
