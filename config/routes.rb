# config/routes.rb
Rails.application.routes.draw do
  resources :students
  resources :mentors
  resources :enrollments
  resources :mentor_enrollment_assignments
  resources :lessons
  resources :courses
  resources :coding_classes

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  # --- API routes ---
namespace :api do
  namespace :v1 do
    post '/students', to: 'students#create'
    get '/students', to: 'students#index'   # you added this
  end
end
end
