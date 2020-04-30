class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :assignments
  has_many :roles, through: :assignments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def likes?(post)
    post.likes.where(user_id: id).any?
  end

  def admin?
    check_role(roles, ["admin"])
  end

  def author?(post, user)
    check_role(roles, ["admin"]) or (post.user_id == user.id and check_role(roles, ["author"]))
  end

  def subscriber?
    check_role(roles, ["subscriber"])
  end

  private

  def check_role(user_roles, roles_to_check)
     user_roles.map(&:name).any? {|r| roles_to_check.include?(r) } 
  end
end
