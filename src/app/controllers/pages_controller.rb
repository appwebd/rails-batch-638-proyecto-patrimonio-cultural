class PagesController < ApplicationController
  #  before_action :set_user, only: %i[home politica_de_privacidad resultado termino_de_uso]
  skip_before_action :authenticate_user!, only: %i[contacto home politica_de_privacidad resultado termino_de_uso]

  def contacto
    render('contacto')
  end

  def home
    @results = get_geocode_by_ip_address
    @ciudad = get_geocode_ciudad(@results)

    @patrimonio = Patrimonio.new
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
    # patrimonio = params[:patrimonio]

    @patrimonios = Patrimonio.all #near(patrimonio[:ubicacion], 10) #Patrimonio.near(home_buscar_params, 10)
    @markers = @patrimonios.map do |pages|
      {
        lat: pages.geo_ref_latitud,
        lng: pages.geo_ref_longitud,
        info_window: render_to_string(partial: "inforesultado", locals: { pages: pages })
      }
    end
  end

  def politica_de_privacidad
    render('politica-de-privacidad')
  end

  def termino_de_uso
    render('terminos-de-uso')
  end

  private

  def set_user
    @user = current_user unless current_user.nil? # Necesario para asociar registros
  end

  # TODO: Revisar al preparar vista con resultados.
  def home_buscar_params
    params.require(:patrimonio).permit(:ubicacion)
  end
end
