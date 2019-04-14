Rails.application.routes.draw do
  resources :groups do
    member do

      get 'edit_project_name'
      put 'update_project_name'

      get 'edit_score'
      put 'update_score'
      
      get 'add_subscribers', to: 'subscribers#add_subscribers'
      put 'add_subscriber', to: 'subscribers#add_subscriber'
      delete 'remove_subscriber', to: 'subscribers#remove_subscriber'

    end
  end
  resources :courses do
    member do
      post 'subscribe'
      delete 'unsubscribe'
      get 'groups'
      get 'new_group'
      post 'create_group'
      get 'subscribers'
    end
  end
  root 'home#index'
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
