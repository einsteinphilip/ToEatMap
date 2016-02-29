Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  resources :restaurants do
	  collection do
	    get  :map
	  end
  end	    
  root to: "restaurants#map"
end
