Rails.application.routes.draw do
  resources :wikis

  devise_for :users

  get 'about' => 'welcome#about'
  
  get 'downgrade' => 'charges#downgrade'
  
  resources :charges, only: [:new, :create]
  resources :collaborators, only: [:create, :destroy]

  root 'welcome#index'
end
