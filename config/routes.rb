Rails.application.routes.draw do
  devise_for :users

  # users show page
  resources :users, only: [:index, :show]
	
	resources :posts do
		resources :comments, only:[:create]
	end

	root "pages#index"
end
