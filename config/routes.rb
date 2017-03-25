Rails.application.routes.draw do
  scope :api do
    namespace :admin do
      resources :users do
        post 'login', on: :collection, to: 'sessions#create'
      end
      resources :courses
    end

    post 'users/login', to: 'sessions#create'
    resources :courses, only: %i(index show) do
      resources :lectures
    end
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
