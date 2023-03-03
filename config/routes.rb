Rails.application.routes.draw do
  get 'shops/new'
  get 'shops/edit'
  get 'showAll', to: 'shops#shops'
  devise_for :users
  root 'static_pages#home'
  get 'help', to: 'static_pages#help'
  resources :shops do
    resources :books
  end
  # as :user do
  #   get 'signin' => 'devise/sessions#new'
  #   post 'signin' => 'devise/sessions#create'
  #   delete 'signout' => 'devise/sessions#destroy'
  # end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
