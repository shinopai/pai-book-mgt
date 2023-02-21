Rails.application.routes.draw do
  # root
  root 'books#index'

  # books
  # create
  get '/book/create', to: 'books#create_index', as: :books_create
  post '/book/create/confirm', to: 'books#create_confirm', as: :books_create_confirm
  post '/book/create/submit', to: 'books#create_submit', as: :books_create_submit
  get '/book/create/finish', to: 'books#create_finish', as: :books_create_finish

  # show
  get 'book/:id', to: 'books#show', as: :books_show
end
