class OferenteController < ApplicationController
  before_action :configure_sign_up_params, only: [:create]

  def indice
  end

  def nuevo
    @oferente = Oferente.new
  end

  def crear
    @oferente = Oferente.new(params_oferente)
    if @oferente.save
      redirect_to lists_path(@oferente.id)
    else
      render :new
    end
  end

  def calificacion
  end

  def editar
    # application does not need implementation code
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

  def params_oferente
    params.require(:oferente).permit(:nombre)
  end

  private

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    params.require(:user).permit(:apellidos, :email, :nombre)
  end
end
