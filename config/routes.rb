Rails.application.routes.draw do
  root 'general#top'

  devise_for :users

  namespace :user do
    resources :posts
  end
end
