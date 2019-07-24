Rails.application.routes.draw do
  root 'projects#index'
  devise_for :users
  resources :users
  resources :tasks

  resources :projects do
    resources :tasks
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
