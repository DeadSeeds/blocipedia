class CollaborationPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
      @user = user
      @post = post
  end

  def destroy?
    user.premium? || user.admin?
  end

  def create?
    user.premium? || user.admin?
  end

end
