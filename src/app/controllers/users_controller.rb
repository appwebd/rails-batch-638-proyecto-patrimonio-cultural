class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[:update]

  before_action :set_user, only: %i[destroy edit update show]

  def index
  end

  # POST /
  def update
    if @user.update(get_user_params)
      redirect_to @user, notice: 'Usuario ha sido guardado correctamente.'
    else
      render :edit
    end
  end

  def show
    # Muestra vista app/views/users/show.html.erb
  end

  def edit
    # Muestra vista app/views/users/_edit.html.erb
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
  def get_user_params
    params.require(:user).permit(:apellidos, :email, :nombre, :photo)
  end
end
