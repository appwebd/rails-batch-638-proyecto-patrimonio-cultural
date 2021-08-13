Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users

  root to: 'pages#home'
  post '/resultado', to: 'pages#resultado', as: :resultado
  get '/terminos-de-uso', to: 'pages#termino_de_uso'
  get '/politica-de-privacidad', to: 'pages#politica_de_privacidad'

  #
  # TODO: refactorizar 12-26 en resources :oferente
  #
  get 'oferentes/index', to: 'oferente#index', as: :oferentes

  # crear un nuevo registro
  get 'oferentes/new', to: 'oferente#new', as: :nuevo_oferente
  post 'oferente', to: 'oferente#create'

  # Mostrar
  get 'oferentes/:id', to: 'oference#show', as: :mostrar_oferente

  # Actualizar
  get 'oferentes/:id/edit', to: 'oferente#edit', as: :editar_oferente
  patch 'oferentes/:id', to: 'oferente#update'

  # Eliminar el registro
  delete 'oferentes/:id', to: 'oferente#destroy'


  # Editar el perfil de usuario
  authenticate :user do
    resources :users, only: [:index, :show]
  end
end
