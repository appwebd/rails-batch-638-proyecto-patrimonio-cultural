class CalificacionPolicy < ApplicationPolicy
  attr_reader :user, :calificacion

  class Scope < Scope
    def initialize(user, calificacion)
      @user = user
      @calificacion = calificacion
    end

    def resolve
      true # scope.all #user_is_owner_or_admin? true #@patrimonio == @user || user.admin?
    end
  end

  def index?
    true
  end

  def new?
    user.present?
  end

  def create?
    user.present?
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
    true if record.user == user || user&.tipo_usuario == 1
  end
end
