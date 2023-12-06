Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get '/first_page', to: 'first_page#index', as: :first_page
  get 'top/index'
  authenticated :user do
    root 'top#index', as: :authenticated_root
  end
  root 'welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
