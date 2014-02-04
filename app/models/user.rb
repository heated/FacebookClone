class User < ActiveRecord::Base
  attr_reader :password
  before_validation :reset_session_token, :on => :create
  attr_accessible :email, :name, :gender, :birthday, :password_digest, 
                  :password, :profile_pic, :familiarity
  attr_reader :familiarity
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

  has_many :fans,
           :through => :acceptable_requests,
           :source => :user_from

  has_many :friends,
           :through => :friendships,
           :source => :user_to

  has_many :friend_posts,
           :through => :friends,
           :source => :posts,
           :uniq => :true

  has_many :comments

  has_many :commented_posts,
           :through => :comments,
           :source => :post,
           :uniq => :true

  has_many :requests,
           :foreign_key => :user_from_id,
           :class_name => "FriendRequest"

  has_many :idols,
           :through => :requests,
           :source => :user_to

  has_attached_file :profile_pic, :styles => {
    :original => "300x300>",
    :small => "50x50#"
  }

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
    PrivateMessage
      .where("? in (user_to_id, user_from_id)", self.id)
      .includes(:user_to, :user_from)
  end

  def feed_posts
    Post.with_comments
      .where('posts.user_id IN (?) OR comments.user_id IN (?)', 
             community, community)
      .includes(:user, :comments => :user)
  end

  def community
    @community ||= (self.friend_ids + [self.id])
  end

  def wall_posts
    Post.with_comments
      .where('? in (posts.user_id, comments.user_id)', self.id)
      .includes(:user, :comments => :user)
  end

  def interactable_individuals
    (self.community + self.fan_ids + self.idol_ids).uniq
  end

  def friends_of_friends
    # friends of friends
    # who are not you, nor your friends
    # and who you have not requested friendship, nor they, you
    # sorted by mutual friends count
    # and including that count for each friend

    query = <<-SQL
      SELECT u2.*, COUNT(u2.*) familiarity
      FROM users u1
      JOIN friendships f1
        ON u1.id = f1.user_from_id
      JOIN friendships f2
        ON f1.user_to_id = f2.user_from_id
      JOIN users u2
        ON u2.id = f2.user_to_id
      WHERE u1.id = (?)
      AND u2.id NOT IN (?)
      GROUP BY u2.id
      ORDER BY familiarity DESC
    SQL

    User.find_by_sql([query, self.id, self.interactable_individuals])
  end

  def to_builder
    Jbuilder.new do |user|
      user.(self, :id, :name)
      user.icon self.profile_pic.url(:small)
    end
  end
end
