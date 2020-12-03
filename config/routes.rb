Rails.application.routes.draw do
  # get 'estados/inicio'
  resources :usuarios
  match '/validar_rfc' => 'usuarios#validar_rfc', via: :get, :as => :validar_rfc_usuarios

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '/estados' => 'estados#inicio', via: :get, :as => :estados_inicio
  match '/estado/:id/mostrar' => 'estados#mostrar', via: :get, :as => :mostrar_estado
  match '/estado/nuevo' => 'estados#nuevo', via: :get, :as => :estados_nuevo
  match '/estado/crear' => 'estados#crear' , via: :post, :as => :crear_estado
  match '/estado/:id/editar' => 'estados#editar', via: :get, :as => :editar_estado
  match '/estado/:id/actualizar' => 'estados#actualizar', via: :patch, :as => :actualizar_estado
  match '/estado/:id/eliminar' => 'estados#eliminar', via: :delete, :as => :eliminar_estado

  ##Paises
  match '/paises' => 'paises#inicio', via: :get, :as => :paises_inicio
  match '/pais/nuevo' => 'paises#nuevo', via: :get, :as => :paises_nuevo
  match '/pais/crear' => 'paises#crear', via: :post, :as => :crear_pais
  match 'pais/:id/mostrar' => 'paises#mostrar', via: :get, :as => :mostrar_pais
  match 'pais/:id/editar' => 'paises#editar', via: :get, :as => :editar_pais
  match 'pais/:id/actualizar' => 'paises#actualizar', via: :patch, :as => :actualizar_pais
  match 'pais/:id/eliminar' => 'paises#eliminar', via: :delete, :as => :eliminar_pais


  #busqueda
  match '/buscar_usuario' => 'usuarios#index', via: :post, :as => :buscar_usuarios

  match '/login' => 'sesiones#login', via: :get, :as => :login
  match '/validar_usuario' => 'sesiones#validar_usuario', via: :post, :as => :validar_usuario
  match '/cerrar_sesion' => 'sesiones#cerrar_sesion', via: :delete, :as => :cerrar_sesion

  root :to => 'sesiones#login'



end
