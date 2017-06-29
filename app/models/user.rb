# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  height          :integer
#  weight          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_reader :password
  validates :username, presence: true, uniqueness: true
  validates :session_token, presence: true
  validates :password_digest, presence: {message: "Password can't be blank"}
  validates :password, allow_nil: true, length: {minimum: 6}
  before_validation :ensure_session_token

  has_many :workouts
  has_many :records
  has_many :logs, through: :workouts

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    if user
      return user.is_password?(password) || nil
    end
  end

  private
  def self.generate_session_token
    return SecureRandom::urlsafe_base64
  end
end
