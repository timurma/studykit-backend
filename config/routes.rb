Rails.application.routes.draw do
  scope :api do
    resources :courses, only: %i(index create) do
      resources :lectures, only: %i(index)
    end
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
