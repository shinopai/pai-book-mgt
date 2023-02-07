Rails.application.routes.draw do
  # root
  root 'books#index'

  # books
  # create
  get '/book/create', to: 'books#create_index', as: :books_create
  post '/book/create/confirm', to: 'books#create_confirm', as: :books_create_confirm
end
