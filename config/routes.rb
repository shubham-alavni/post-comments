# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  namespace :api do
    namespace :v1 do
      resources :posts, only: %i[create index] do
        resources :comments, only: %i[create index] do
          resources :replies, only: [:create]
        end
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
