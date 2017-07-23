Rails.application.routes.draw do
  resources :schedules
  resources :action_plans
  devise_for :users

  root to: 'home#index'

  resource :mypage
end
