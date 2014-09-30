Rails.application.routes.draw do
  get "/about", to: 'static#about', as: :about 
  get "/soon", to: 'static#soon', as: :soon 

  devise_for :admins
  resources :articles do
    resources :pictures, only: [:new, :create, :destroy] 
    resources :comments
  end
  
  root to: 'articles#index'
end

