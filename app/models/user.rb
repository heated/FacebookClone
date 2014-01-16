class User < ActiveRecord::Base
  attr_reader :password
  before_validation :reset_session_token
  attr_accessible :email, :password, :name, :gender, :birthday, :password_digest
  validate :email, :password, :name, :session_token, :gender, :birthday, :password_digest, :presence => true
  validate :password, :length => { :minimum => 6 }

  has_many :sent_messages,
           :class_name => "PrivateMessage",
           :foreign_key => :user_from_id

  has_many :recieved_messages,
           :class_name => "PrivateMessage",
           :foreign_key => :user_to_id

  has_many :posts

  def reset_session_token
    self.session_token = SecureRandom.urlsafe_base64
  end

  def password=(plaintext)
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
    self.sent_messages + self.recieved_messages
  end
end
