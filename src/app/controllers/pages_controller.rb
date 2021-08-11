class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[contacto home politica_de_privacidad termino_de_uso]

  def contacto
    render('contacto')
  end

  def home
    @current_location_by_ip = client_ip
    @results = Geocoder.search(@current_location_by_ip)
    @ciudad = @results.first.city
    @markers = @results.map do |ubicacion|
      {
        lat: ubicacion.latitude,
        lng: ubicacion.longitude,
        info_window: render_to_string(partial: "infowindow", locals: { ubicacion: ubicacion })
      }
    end
  end

  def politica_de_privacidad
    render('politica-de-privacidad')
  end

  def termino_de_uso
    render('terminos-de-uso')
  end
end
