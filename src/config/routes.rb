# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do

  #get 'errors/not_found'
  #get 'errors/internal_server_error'



  devise_for :users,
             controllers: {
               sessions: "users/sessions",
               registrations: "users/registrations",
               #             passwords: "users/passwords"
             }

  root to: 'pages#home'
  post '/resultado', to: 'pages#resultado', as: :resultado
  get '/resultado', to: 'pages#home'
  get '/terminos-de-uso', to: 'pages#termino_de_uso'
  get '/politica-de-privacidad', to: 'pages#politica_de_privacidad'

  resources :patrimonios

  # Editar el perfil de usuario
  authenticate :user do
    resources :users, only: [:index, :edit, :update, :show, :destroy]
  end

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
