Rails.application.routes.draw do
  root 'code_executor#execute'

  scope :api do
    namespace :admin do
      resources :articles
      resources :courses do
        resources :lectures do
          resources :lectures_content, only: %i(create update destroy)
        end
      end
      resources :users do
        post 'login', on: :collection, to: 'sessions#create'
      end
    end

    resources :articles, only: %i(index show)
    resources :courses, only: %i(index show) do
      resources :lectures do
        resources :lectures_content, only: %i(create update destroy)
      end
    end
    post 'users/login', to: 'sessions#create'
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
