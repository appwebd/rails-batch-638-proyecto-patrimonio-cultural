class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :contacto, :home, :politica_de_privacidad, :termino_de_uso  ]

  def contacto
    render ('contacto')
  end

  def home
  end

  def politica_de_privacidad
    render ('politica-de-privacidad')
  end

  def termino_de_uso
    render ('terminos-de-uso')
  end

end
