Rails.application.routes.draw do
  scope :api do
    namespace :admin do
      resources :users, only: %i(create) do
        post 'login', on: :collection, to: 'sessions#create'
      end
      resources :courses, only: %i(index show create)
    end

    post 'users/login', to: 'sessions#create'
    resources :courses, only: %i(index show) do
      resources :lectures, only: %i(index create)
    end
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
