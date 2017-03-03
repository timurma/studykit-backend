Rails.application.routes.draw do
  resources :courses, only: %i(index)

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
