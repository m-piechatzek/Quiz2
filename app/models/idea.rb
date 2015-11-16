class Idea < ActiveRecord::Base
  belongs_to :user

  has_many(:comments, {dependent: :destroy})
    has_many :user_comments, through: :user

    has_many :likes, dependent: :destroy
has_many :liking_users, through: :likes, source: :user

has_many :joins, dependent: :destroy
has_many :joining_users, through: :joins, source: :user

  def like_for(user)
    likes.find_by_user_id(user)
  end

  def join_for(user)
    joins.find_by_user_id(user)
  end

end
