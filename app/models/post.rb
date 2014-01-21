class Post < ActiveRecord::Base
  attr_accessible :body, :user_id
  validates :body, :user_id, :presence => true
  belongs_to :user
  has_many :comments,
           :include => :user

  def to_builder
    Jbuilder.new do |post|
      post.(self, :id, :created_at, :updated_at, :body)

      post.user self.user.to_builder

      post.comments self.comments do |comment|
        post.(comment, :id, :created_at, :updated_at, :body)
        post.user comment.user.to_builder
      end
    end
  end
end
