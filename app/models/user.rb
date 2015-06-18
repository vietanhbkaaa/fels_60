class User < ActiveRecord::Base
  has_many :lessons
  has_many :courses, through: :lessons
  has_many :active_relationships, class_name: "Relationship",
    foreign_key: "follower_id",
    dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
    foreign_key: "followed_id",
    dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :following, through: :active_relationships, source: :followed
  has_secure_password
  
  validates :name, presence: true, length: {maximum: Settings.maximum.name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.maximum.email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false} 
  validates :password, presence: true, length: {minimum: Settings.minimum.password}

  before_save :downcase_email

  private
  def downcase_email
    self.email = email.downcase
  end
end
