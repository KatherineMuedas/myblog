Rails.application.routes.draw do
  resources :articles do
    resources :pictures, only: [:new, :create, :destroy] 
    resources :comments
  end
  
  root to: 'welcome#index'
end

