Rails.application.routes.draw do
  resources :achievements,  controller: 'admin/achievements'
  resources :job_histories,  controller: 'admin/job_histories'
  resources :technologies, controller: 'admin/technologies'
  get 'about/index'
  resources :blogs, only: [:index, :show]

  resources :tech_categories, controller: 'admin/tech_categories'
  get 'admin' => 'admin/root#index'
  namespace :admin do
    resources :sessions, only: [:new, :create]
    get 'session' => 'admin/session#new'
    post 'session' => 'admin/session#create'
    resources :blogs
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "about#index"
end
