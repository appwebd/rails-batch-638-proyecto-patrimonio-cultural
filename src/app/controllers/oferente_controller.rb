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

end
