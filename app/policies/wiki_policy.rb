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
    if post.private
      user.admin? || user == post.user || post.collaborators.include?(user)
    elsif post.private == false
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
      wikis = []

      if user.nil? || user.standard?
        pub_wikis = scope.all
        pub_wikis.each do |pubwiki|
          if pubwiki.private == false || pubwiki.collaborators.include?(user)
            wikis << pubwiki
          end
        end
      elsif user.role == 'admin'
        wikis = scope.all
      elsif user.role == 'premium'
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if wiki.private == false || wiki.user == user || wiki.collaborators.include?(user)
            wikis << wiki
          end
        end
      end
      wikis
    end
  end

end
