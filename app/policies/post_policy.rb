class PostPolicy < ApplicationPolicy
  attr_reader :user, :post
  
  def initialize(user, post)
    @user = user
    @post = post
  end

  def create?
    user.admin?
  end

  def edit?
    user.author?(@post, @user)
  end

  def show?
    user.subscriber? or user.admin?
  end
end