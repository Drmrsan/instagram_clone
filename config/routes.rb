Rails.application.routes.draw do
  devise_for :users

  # users show page
  resources :users, only: [:index, :show]
	
	resources :posts do
		member do
			put "like", to: "posts#upvote"
		end
		resources :comments, only:[:create]
	end

	root "pages#index"
end
