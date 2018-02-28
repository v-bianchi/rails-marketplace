class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.where(user: user)
      scope.all
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  private

  def user_is_owner_or_admin?
    user.admin || record.user == user
  end
end
