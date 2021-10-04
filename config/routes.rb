Rails.application.routes.draw do
  devise_for :users
  resources :news
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'news#index'
end
