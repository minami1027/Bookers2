Rails.application.routes.draw do
  get 'home/about'
  get 'todolists/Home'
  devise_for :users
  resources :books,only: [:top, :create, :show, :edit, :index, :destroy, :update]
  root'books#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
end
