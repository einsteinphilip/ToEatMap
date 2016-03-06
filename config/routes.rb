Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  get 'tags/:tag', to: 'restaurants#index', as: :tag
  resources :restaurants do
	  collection do
	    get  :map
	  end
  end	    
  root to: "restaurants#map"
end
