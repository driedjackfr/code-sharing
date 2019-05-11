Rails.application.routes.draw do
  root 'general#top'

  devise_for :users

  resources :posts, only: :show

  namespace :user do
    resources :posts
  end
end
