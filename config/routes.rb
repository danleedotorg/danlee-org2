Rails.application.routes.draw do
  get 'about/index'
  resources :blogs, only: [:index, :show]

  namespace :admin do
    resources :sessions, only: [:new, :create]
    get 'session' => 'admin/session#new'
    post 'session' => 'admin/session#create'
    resources :blogs
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "about#index"
end
