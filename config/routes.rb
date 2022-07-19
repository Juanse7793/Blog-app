Rails.application.routes.draw do
  devise_for :users

root 'users#index'

  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :show, :new, :create]
    post "/likes/:id/like" => "likes#like", as: :likes
    post "/comments/:id/comment" => "comments#comment", as: :comments
  end
  resources :posts, only: [:new, :create]
end
