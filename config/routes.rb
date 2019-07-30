Rails.application.routes.draw do
  root to: 'home#top'
  devise_for :users
  resources :users
  resources :books
  get 'home/about', to: 'home#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
