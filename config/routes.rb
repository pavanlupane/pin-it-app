Rails.application.routes.draw do
  devise_for :users
  resources :pins do
  	member do
  		put "like", to: "pins#upvote"
  	end
  end

  root "pins#index"

  resources :subscribe

  get "subscribe" => "subscribe#new"
end
