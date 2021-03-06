Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    :registrations => 'registrations'
  }

  resources :users do
    resources :programs
    get '/workout_history', to: 'workouts#index', as: 'workout_history'
    get '/next_workout', to: 'workouts#new', as: 'next_workout'
  end

  resources :programs
  resources :workouts, only: [:create]
  resources :workout_templates
  resources :exercise_templates, only: [:new, :create, :edit, :update]

  root to: "home#index"

  get '/profile', to: 'users#show', as: 'profile'
  get '/my_programs', to: 'programs#index', as: 'my_programs'
  get '/my_workout_templates', to: 'workout_templates#index', as: 'my_workout_templates'
  get '/my_exercise_templates', to: 'exercise_templates#index', as: 'my_exercise_templates'
  get '/leaderboard', to: 'users#leaderboard', as: 'leaderboard'

  post '/programs/:id', to: 'programs#select'


end
