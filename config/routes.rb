Rails.application.routes.draw do
  devise_for :users
  resources :restaurants do
	  collection do
	    get  :map
	  end
  end	    
  root to: "restaurants#map"
end
