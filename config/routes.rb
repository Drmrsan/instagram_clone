Rails.application.routes.draw do
  devise_for :users

  # users show page
  resources :users, only: [:index, :show]
	
	resources :posts do
		member do
			put "like", to: "posts#upvote"
			put "unlike", to: "posts#downvote"
		end
		resources :comments, only:[:create, :destroy]
	end

	root "pages#index"
end
