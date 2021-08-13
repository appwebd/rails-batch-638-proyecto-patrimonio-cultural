class OferenteController < ApplicationController
  before_action :configure_sign_up_params, only: [:create]

  def indice
    # TODO: En desarrollo oferente/índice
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
    # TODO: En desarrollo oferente/calificacion
  end

  def editar
    # application does not need implementation code
  end

  def actualizar
    # TODO: En desarrollo oferente/actualizar
  end

  def eliminar
    # TODO: En desarrollo oferente/eliminar
  end

end
