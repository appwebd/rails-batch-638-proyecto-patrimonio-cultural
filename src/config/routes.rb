Rails.application.routes.draw do

  get 'oferente/index'
  get 'oferente/create'
  get 'oferente/new'
  get 'oferente/update'
  get 'oferente/destroy'
  root to: 'pages#home'

  Rails.application.routes.draw do
  get 'oferente/index'
  get 'oferente/create'
  get 'oferente/new'
  get 'oferente/update'
  get 'oferente/destroy'
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  end

  get '/terminos-de-uso', to: 'pages#termino_de_uso'
  get '/politica-de-privacidad', to: 'pages#politica_de_privacidad'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
