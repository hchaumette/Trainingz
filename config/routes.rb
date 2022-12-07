Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :dashboards, only: [:index]
  resources :rounds, only: :update do
    resources :workout_exercises
  end
  resources :workouts do
    resources :rounds, only: %i[create new]
    resources :user_workouts, only: %i[index create]
  end

  resources :coachings, only: %i[index create]

  get '/workouts/:id/created', to: "workouts#created", as: :created
  get '/workouts/:id/share', to: "workouts#share", as: :share
  get '/workouts/:id/success', to: "workouts#success", as: :success
end
