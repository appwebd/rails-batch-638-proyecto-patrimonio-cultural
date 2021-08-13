class UsersController < ApplicationController
  skip_after_action :verify_authorized, only: [:index]
  skip_before_action :authenticate_user!, only: [:index]

  before_action :set_user, only: %i[edit destroy update show]

  def index
    authorize @user
  end

  # POST /
  def update
    # TODO: se debe permitir al perfil usuario actualizar su informacion
  end

  def show
    # TODO: desarrollar perfil de usuario
  end

  def edit
    # TODO: se debe permitir al perfil usuario editar su informacion
  end

  def destroy
    # TODO: se debe permitir al perfil usuario autoeliminarse de la base de datos
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:apellidos, :photo, :nombre)
  end
end
