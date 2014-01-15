class User < ActiveRecord::Base
  attr_reader :password
  before_validation :reset_session_token
  attr_accessible :email, :password, :name, :gender, :birthday, :password_digest
  validate :email, :password, :name, :session_token, :presence => true
  validate :password, :length => { :minimum => 6 }

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
end
