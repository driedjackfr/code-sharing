Rails.application.routes.draw do
  root 'general#top'

  devise_for :users
end
