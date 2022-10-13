Rails.application.routes.draw do
  root 'cats#index'
  resources :cats, only: %i[index new create edit udpate destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
