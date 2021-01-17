Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]

  get 'memos/index'
  root to: "memos#index"
  
  resources :memos, except: :index do
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: :create
  end

  post 'memos/attach', to: 'memos#attach'
end
