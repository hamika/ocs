Rails.application.routes.draw do
  resources :customers
  resources :schedules
  resources :action_plans
  devise_for :users
  get 'dashboards', to: 'dashboards#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'schedules#index'

  # resource :mypage
end
