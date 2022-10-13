Rails.application.routes.draw do
  root 'cats#index'
  resources :cats do
    resource :notation_setting, only: %i(edit update)
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
