class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception. For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: :resultado

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?


#  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  IP_ADDRESS = ENV['IP_ADDRESS_PUBLIC'] # Hard coded remote address
  IP_LOCALHOST_IPV4 = '127.0.0.1'
  IP_LOCALHOST_IPV6 = '::1'

  # devise authorization
  # For additional fields in app/views/devise/registrations/new.html.erb
  # For additional in app/views/devise/registrations/edit.html.erb
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[apellidos nombre])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[apellidos nombre])
  end

  def client_ip
    if request.remote_ip == IP_LOCALHOST_IPV4 || request.remote_ip == IP_LOCALHOST_IPV6
      IP_ADDRESS
    else
      request.remote_ip
    end
  end

  def get_geocode_by_ip_address
    @current_location_by_ip = client_ip
    @results = Geocoder.search(@current_location_by_ip)
  end

  def get_geocode_ciudad(results)
    @ciudad = ""
    @ciudad = results.first.city unless results.first.nil?
  end

  private

  def skip_pundit?

    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def user_not_authorized
    flash[:alert] = "Debe registrarse para realizar esa acción"
    redirect_to(request.referrer || root_path)
  end
end
