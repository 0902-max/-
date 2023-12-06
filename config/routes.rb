Rails.application.routes.draw do
  get 'top/index'
  get 'welcome/index'
  devise_for :users
  authenticated :user do
    root 'top#index', as: :authenticated_root
  end
  root 'welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
