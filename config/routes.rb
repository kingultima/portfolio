Rails.application.routes.draw do
	devise_for :users
	resources :hospitals
	get 'search', to: 'hospitals#search', as: 'search'
	get 'map', to: 'hospitals#map', as: 'maps'
	# get '/user/about' => 'users#about', as: 'about'
	# get 'users/top', as: 'top'
	root to: 'hospitals#index', as: 'root'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
