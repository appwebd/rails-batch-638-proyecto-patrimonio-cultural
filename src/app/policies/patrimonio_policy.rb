class PatrimonioPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.order(created_at: :desc)
    end
  end

  def create?
    true
  end


  def show?
    true
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    record.user == user || user.admin?
  end
end
