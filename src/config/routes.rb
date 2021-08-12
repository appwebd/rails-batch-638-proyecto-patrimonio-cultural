Rails.application.routes.draw do

  root to: 'pages#home'
  post 'resultado/', to: 'pages#resultado', as: :resultado

  Rails.application.routes.draw do
    get 'oferentes/index', to: 'oferente#index', as: :oferentes

    # crear un nuevo registro
    get 'oferentes/nuevo', to: 'oferente#nuevo', as: :nuevo_oferente
    post 'oferente', to: 'oferente#crear'

    # Mostrar
    get 'oferentes/:id', to: 'oference#mostrar', as: :mostrar_oferente

    # Actualizar
    get 'oferentes/:id/editar', to: 'oferente#editar', as: :editar_oferente
    patch 'oferentes/:id', to: 'oferente#actualizar'

    # Eliminar el registro
    delete 'oferentes/:id', to: 'oferente#eliminar'



    #devise_for :users,
    #           :path => "oferente",
    #           :path_names => {
    #             :sign_in => 'control-de-acceso',
    #             :sign_out => 'desconectar',
    #             :password => 'secret',
    #             :confirmation => 'verificacion',
    #             :unlock => 'desbloquear',
    #             :registrations => 'registrarse',
    #             :sign_up => 'inscribirse'
    #           }


    devise_for :users
  end

  get '/terminos-de-uso', to: 'pages#termino_de_uso'
  get '/politica-de-privacidad', to: 'pages#politica_de_privacidad'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
