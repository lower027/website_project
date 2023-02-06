Rails.application.routes.draw do
  resources :interests

  devise_for :users, controllers: {
      registrations: 'users/registrations'
    } 

 
  
  resources :users, only: [:index] do
    resources :profiles, except: [:index, :destroy]
  end

 root to: 'home#index'
  
end
