class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      #if user.admin?
      # scope.all
      #else
      #  scope.where(user = current_user)
      #end
    end
  end

  def create?
    true
  end

  def show?
    # binding.pry permite entrar a debug
    user_is_owner_or_admin?
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    record == user || user.admin?
  end
end
