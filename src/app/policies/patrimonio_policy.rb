class PatrimonioPolicy < ApplicationPolicy
  attr_reader :user, :patrimonio

  class Scope < Scope
    def initialize(user, patrimonio)
      @user = user
      @patrimonio = patrimonio
    end

    def resolve
      true #@patrimonio == @user || user.admin?
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
    record == user #|| user.tipo_usuario == 1
  end
end
