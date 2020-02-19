Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :documents
  authenticated :user do
  	root "documents#index", as: "authenticated_root"
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
  }
  root 'welcome#index'
end
