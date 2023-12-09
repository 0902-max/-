Rails.application.routes.draw do
  get 'results/show'
  get 'past_questions/index'
  get 'past_questions/show'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get '/first_page', to: 'first_page#index', as: :first_page
  get '/first_page/second_page', to: 'first_page#second_page', as: :second_page
  get '/first_page/third_page', to: 'first_page#third_page', as: :third_page
  get 'top/index'
  authenticated :user do
    root 'top#index', as: :authenticated_root
  end
  resources :users do
    resources :documents
  end
  get 'roadmap', to: 'roadmap#show', as: :roadmap
  get '/grants', to: 'grants#index', as: :grants
  get 'documents/index'
  resources :past_questions, only: [:index, :show] do
    member do
      get 'start'
      post 'answer'
    end
  end
  get 'result', to: 'results#show'
  get '/flashcards', to: 'flashcards#index', as: 'flashcards'
  get '/flashcards/:vocabulary_note_id/new_entry', to: 'vocabulary_entries#new', as: 'new_vocabulary_entry'
  post '/flashcards/:vocabulary_note_id/new_entry', to: 'vocabulary_entries#create_entry'
  root 'welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
