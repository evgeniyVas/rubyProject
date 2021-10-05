require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  devise_for :users
  resources :news
  root 'news#index'
  mount Sidekiq::Web => '/sidekiq'
end
