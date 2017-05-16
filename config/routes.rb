Rails.application.routes.draw do
  scope :api do
    namespace :admin do
      resources :articles, :courses, :lectures, :lecture_contents, :sql_problems
      resources :users do
        post 'login', on: :collection, to: 'sessions#create'
      end
    end

    resources :articles, only: %i(index show)
    resources :sql_solutions, only: %i(show create)
    resources :courses, only: %i(index show)
    resources :lectures, only: %i(index show) do
      resources :lecture_contents, only: %i(show create update destroy), path: 'content'
    end
    resources :users, only: %i(show create destroy) do
      post 'login', on: :collection, to: 'sessions#create'
    end
    get 'users/:user_id/courses', to: 'courses#index'
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  apipie
end
