Rails.application.routes.draw do
  devise_for :users
  root to: 'lists#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "my_lists", to: "lists#my"
  get "o_list/:id", to: "lists#othershow", as: :other_show
  resources :lists, only: [:index, :show, :new, :create, :destroy] do
    resources :bookmarks, only: [:new, :create]
    resources :reviews, only: [:create]
  end

  resources :bookmarks, only: [:destroy]
  resources :reviews, only: :destroy
end
