Rails.application.routes.draw do
  get 'order_detail/create'
  get 'order/show'

  # get 'cart_details/create'
  # get 'cart_details/update'
  # get 'cart_details/destroy'
  get 'carts/show'
  get 'shops/new'
  get 'shops/edit'

  get 'showAll', to: 'shops#shops'
  get 'search', to: 'static_pages#search'
  get 'category', to: 'static_pages#category'
  devise_for :users
  root 'static_pages#home'

  resources :books
  resources :shops do
    resources :books
    get 'order', to: 'shops#order'
    get 'bill', to: 'shops#bill'
  end

  resource :cart, only: [:show]
  resources :cart_details, only: %i[create update destroy]
  resources :order_detail, only: %i[create update destroy]
  resources :order, only: %i[update show export_bill] do
    get 'export_bill', to: 'order#export_bill', as: 'export_bill'
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
