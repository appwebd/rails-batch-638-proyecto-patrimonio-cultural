class UsersController < ApplicationController
  skip_after_action :verify_authorized, only: [:index]
  skip_before_action :authenticate_user!, only: [:index]

  before_action :set_user, only: %i[destroy edit update show]

  def index
    authorize @user
  end

  # POST /
  def update
    @user.update(user_params)
    redirect_to user(@user.id)
  end

  def show
    # Muestra vista app/views/users/show.html.erb
  end

  def edit
    # Muestra vista app/views/users/edit.html.erb
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
    params.require(:user).permit(:apellidos, :email, :nombre, :photo, :password, :password_confirmation)
  end
end
