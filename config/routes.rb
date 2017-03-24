Rails.application.routes.draw do
  scope :api do
    post 'users/login', to: 'sessions#create'

    resources :courses, only: %i(index show create) do
      resources :lectures, only: %i(index)
    end

    namespace :admin do
      resources :users, only: %i(create) do
        post 'login', on: :collection, to: 'sessions#create'
      end
    end
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
