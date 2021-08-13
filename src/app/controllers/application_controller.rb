class ApplicationController < ActionController::Base

  IP_ADDRESS = ENV['IP_ADDRESS_PUBLIC'] # Hard coded remote address
  IP_LOCALHOST_IPV4 = '127.0.0.1'
  IP_LOCALHOST_IPV6 = '::1'

  # Prevent CSRF attacks by raising an exception. For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?

  # For additional fields in app/views/devise/registrations/new.html.erb
  # For additional in app/views/devise/registrations/edit.html.erb
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:apellidos, :nombre])
    devise_parameter_sanitizer.permit(:account_update, keys: [:apellidos, :nombre])
  end

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def client_ip
    if request.remote_ip == IP_LOCALHOST_IPV4 || request.remote_ip == IP_LOCALHOST_IPV6
      IP_ADDRESS
    else
      request.remote_ip
    end
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
