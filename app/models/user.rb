class User < ActiveRecord::Base
  has_secure_password
  attr_accessor :no_password_validation

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {maximum:30, minimum: 6}
  validates :email, presence: true, format: {with: EMAIL_REGEX}, uniqueness: true
  validates :password, length:{minimum:6}, unless: :no_password_validation

  before_create :create_remember_token
  before_save {|user|
    user.email = email.downcase
  }

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
