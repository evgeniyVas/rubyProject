require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  get '/about', to: 'static_pages#about'
  devise_for :users
  resources :news do
    resources :comments, except: %i[new show]
  end
  root 'news#index'
  mount Sidekiq::Web => '/sidekiq'
end
