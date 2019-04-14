Rails.application.routes.draw do
  resources :courses
  root 'home#index'
  devise_for :users, :path => 'u', controllers: { registrations: 'users/registrations'}
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
