Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, :controllers => {sessions: "users/sessions", registrations: "users/registrations"}

  root to: 'pages#home'
  post '/resultado', to: 'pages#resultado', as: :resultado
  get '/terminos-de-uso', to: 'pages#termino_de_uso'
  get '/politica-de-privacidad', to: 'pages#politica_de_privacidad'

  #
  # TODO: refactorizar 12-26 en resources :oferente
  #
  resources :patrimonios

  # Editar el perfil de usuario
  authenticate :user do
    resources :users, only: [:index, :edit, :update, :show, :destroy]
  end
end
