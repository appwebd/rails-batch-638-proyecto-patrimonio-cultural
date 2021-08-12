class OferenteController < ApplicationController
  before_action :configure_sign_up_params, only: [:create]

  def index
  end

  def nuevo
  end

  def crear

  end

  def mostrar
  end

  def editar
  end

  def actualizar
  end

  def eliminar
  end

  def registrarse
    @user = User.new(configure_sign_up_params)
    flash[:notice] = @user.error.full_messages.to_sentence unless @user.save
    redirect_to root_path
    byebug
  end

  private
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    params.require(:user).permit(:apellidos, :email, :nombre )
  end
end
