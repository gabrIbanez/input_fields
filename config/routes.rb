Rails.application.routes.draw do
  resources :input_field_options
  # get 'form_pages/create'
  # get 'form_pages/show'
  resources :forms do
    resources :answers, only: [:index, :show]
    resources :input_fields
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { sessions: 'users/sessions' } do 
    get 'sign_in', to: 'devise/sessions#new'
  end
  # Defines the root path route ("/")
  root to: "home#index"

  resources :form_pages
end
