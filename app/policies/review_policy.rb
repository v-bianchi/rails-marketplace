class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      Scope.all
    end
  end

  def show?
    true
  end

  def create?
    user_is_not_owner?
  end

  private

  def user_is_not_owner?
    record.product.user != user
  end

end
