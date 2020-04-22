# config/routes.rb
Rails.application.routes.draw do
  # verb 'path', to: 'controller#action'
  get '/books', to: 'books#index'
end
