class User < ActiveRecord::Base
  attr_reader :password
  before_validation :reset_session_token
  attr_accessible :email, :name, :gender, :birthday, :password_digest, 
                  :password
  validates :email, :name, :gender, :birthday, :password_digest, 
            :session_token, :presence => true
  validates :password, :length => { :minimum => 6 }, :on => :create

  has_many :posts,
           :include => [:user, :comments]

  has_many :friendships,
           :foreign_key => :user_from_id

  has_many :acceptable_requests,
           :foreign_key => :user_to_id,
           :class_name => "FriendRequest"

  has_many :confirmable_friend_requests,
           :through => :acceptable_requests,
           :source => :user_from

  has_many :friends,
           :through => :friendships,
           :source => :user_to

  has_many :friend_posts,
           :through => :friends,
           :source => :posts

  def reset_session_token
    self.session_token = SecureRandom.urlsafe_base64
  end

  def password=(plaintext)
    @password = plaintext
    self.password_digest = BCrypt::Password.create(plaintext)
  end

  def is_password?(plaintext)
    BCrypt::Password.new(self.password_digest).is_password?(plaintext)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    user if user && user.is_password?(password)
  end

  def messages
    PrivateMessage.where("? in (user_to_id, user_from_id)", self.id).includes(:user_to, :user_from)
  end

  def feed_posts
    community = self.friend_ids + [self.id]

    Post.includes(:user, :comments => :user)
      .where('posts.user_id IN (?) OR comments.user_id IN (?)', 
             community, community)

  end

  def wall_posts
    Post.joins(:comments)
      .where('? in (posts.user_id, comments.user_id)', self.id)
      .includes(:user, :comments => :user)
  end

  def to_builder
    Jbuilder.new do |user|
      user.(self, :id, :name)
    end
  end
end
