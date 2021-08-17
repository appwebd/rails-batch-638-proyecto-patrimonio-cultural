class PagesController < ApplicationController
  before_action :set_user, only: %i[home politica_de_privacidad termino_de_uso contacto]
  skip_before_action :authenticate_user!, only: %i[home contacto home politica_de_privacidad termino_de_uso]

  def contacto
    render('contacto')
  end

  def home
    @results = get_geocode_by_ip_address
    @ciudad = get_geocode_ciudad(@results)

    @user = current_user unless current_user.nil? # Necesario para asociar registros
    @markers = @results.map do |pages|
      {
        lat: pages.latitude,
        lng: pages.longitude,
        info_window: render_to_string(partial: "infowindow", locals: { pages: pages })
      }
    end
  end

  def resultado
    # TODO: en desarrollo pages/resultado
  end

  # TODO: en desarrollo pages/política_de_privacidad
  def politica_de_privacidad
    render('politica-de-privacidad')
  end

  # TODO: en desarrollo pages/termino_de_uso
  def termino_de_uso
    render('terminos-de-uso')
  end

  private

  def set_user
    @user = current_user unless current_user.nil? # Necesario para asociar registros
  end

  # TODO: Revisar al preparar vista con resultados.
  def home_buscar_params
    params.require(:localidad).permit(:localidad)
  end
end
