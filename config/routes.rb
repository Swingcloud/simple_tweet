Rails.application.routes.draw do
  devise_for :users

  resources :tweets do
    member do
      post :like
    end
  end
  resources :users

  namespace :admin do
  	root 'dashboard#index'
	end

  root 'tweets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
