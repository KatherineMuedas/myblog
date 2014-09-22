Rails.application.routes.draw do
  devise_for :admins
  resources :articles do
    resources :pictures, only: [:new, :create, :destroy] 
    resources :comments
  end
  
  root to: 'articles#index'
end

