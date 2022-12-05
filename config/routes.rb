Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :rounds, only: :update do
    resources :workout_exercises
  end
  resources :workouts do
    resources :rounds, only: [:create, :new]
  end

  get '/workouts/:id/created', to: "workouts#created", as: :created
end
