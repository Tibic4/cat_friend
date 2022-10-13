Rails.application.routes.draw do
  root 'cats#index'
  resources :cats, only: %i[index new create edit update destroy]
  resources :subjects, only: :create
end
