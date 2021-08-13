class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[contacto home politica_de_privacidad termino_de_uso]

  def contacto
    render('contacto')
  end

  def home
    @current_location_by_ip = client_ip
    @results = Geocoder.search(@current_location_by_ip)

    @ciudad = ""
    @ciudad = @results.first.city unless @results.first.city.nil?

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

  # TODO: Revisar al preparar vista con resultados.
  def home_buscar_params
    params.require(:localidad).permit(:localidad)
  end
end
