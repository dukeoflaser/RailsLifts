Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only:[:show, :edit] do
    resources :programs
  end

  resources :programs, only:[:index, :show]
  root to: "home#index"

  get 'users/:id/next_workout', to: 'workouts#new', as: 'next_workout'


end
