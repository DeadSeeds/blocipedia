class WikiPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def update?
    user.present?
  end

  def destroy?
    user.admin? || user == post.user
  end

end
