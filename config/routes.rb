Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  resources :games
  resources :chess_pieces
  post '/chess_pieces/update/:id' => 'chess_pieces#update'
end
