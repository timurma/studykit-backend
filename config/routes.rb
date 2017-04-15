Rails.application.routes.draw do
  root 'code_executor#execute'

  scope :api do
    namespace :admin do
      resources :articles, :courses, :course_contents
      resources :users do
        post 'login', on: :collection, to: 'sessions#create'
      end
    end

    resources :articles, only: %i(index show)
    resources :courses, only: %i(index show) do
      resources :course_contents, only: %i(show create update destroy), path: 'content'
    end
    resources :users, only: %i(show) do
      post 'login', on: :collection, to: 'sessions#create'
    end
    get 'users/:user_id/courses', to: 'courses#index'
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  apipie
end
