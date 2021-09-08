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
    @params = home_buscar_params

    if @params[:ubicacion].nil?
      @patrimonio = Patrimonio.all
    else
      @patrimonio = Patrimonio.near(@params[:ubicacion], 60)
    end

    @markers = @patrimonio.geocoded.map do |pages|
      {
        lat: pages.latitude,
        lng: pages.longitude,
        info_window: render_to_string(partial: "inforesultado", locals: { pages: pages })
      }
    end

    if @markers.length == 0
      redirect_to root_path, notice: "No se encontraron registros para la ubicación: #{@params[:ubicacion]}"
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

  def home_buscar_params
    params.require(:patrimonio).permit(:ubicacion)
  end
end
