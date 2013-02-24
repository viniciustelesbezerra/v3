Evorav3::Application.routes.draw do
  resources :ufs


  resources :contratos


  resources :lpus

  resources :arquivos

  devise_for :users

  root to: 'application#index'
  
  match 'reports' => 'reports#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'

end
