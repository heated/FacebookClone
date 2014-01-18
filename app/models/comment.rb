class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  attr_accessible :body, :user_id, :post_id
  validates :body, :user_id, :post_id, :presence => true

  def to_builder
    Jbuilder.new do |comment|
      comment.(self, :id, :created_at, :updated_at, :body)
  
      comment.user self.user.to_builder
    end
  end
end
