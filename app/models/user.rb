class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true, uniqueness: true,
              format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_many :ideas, dependent: :nullify

  has_many :comments, dependent: :destroy
  has_many :user_comments, through: :idea, source: :comments


  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :idea

  has_many :joins, dependent: :destroy
  has_many :joined_ideas, through: :joins, source: :idea
end
