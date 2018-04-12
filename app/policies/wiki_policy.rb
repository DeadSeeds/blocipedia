class WikiPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
      @user = user
      @post = post
  end


  def index?
    user.nil? || user.present?
  end

  def update?
    user.present?
  end

  def destroy?
    if user == nil
      false
    else
      user.admin? || user == post.user
    end
  end

  def show?
    user.nil? || user.present?
  end

  def new?
    user.present?
  end

  def create?
    user.present?
  end

  def edit?
    user.present?
  end
end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.present
        scope.all
      else
        scope.all
      end
    end
  end
