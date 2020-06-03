# config/routes.rb
Rails.application.routes.draw do
  # verb 'path', to: 'controller#action'

  get "/auth/github", as: "github_login"
  get "/auth/:provider/callback", to: "users#create"

  root to: 'books#index'

  resources :books
  resources :authors do
    resources :books, only: [:index, :new]
  end

  get "/login", to: "users#login_form", as: "login"
  post "/login", to: "users#login"
  post "/logout", to: "users#logout", as: "logout"
  get "/users/current", to: "users#current", as: "current_user"

  # # Routes that operate on the book collection
  # get '/books', to: 'books#index', as: 'books'
  # get '/books/new', to: 'books#new', as: 'new_book'
  # post '/books', to: 'books#create'

  # # Routes that operate on individual books
  # get '/books/:id', to: 'books#show', as: 'book'
  # get '/books/:id/edit', to: 'books#edit', as: 'edit_book'
  # patch '/books/:id', to: 'books#update'
  # delete '/books/:id', to: 'books#destroy'
end
