Rails.application.routes.draw do
	devise_for :users
	resources :hospitals
	get 'search', to: 'hospitals#search', as: 'search'
	get 'map', to: 'map#index', as: 'maps'
	# get 'about' => 'users#about', as: 'about'
	# root to: 'hospitals#top', as: 'root'
	root to: 'hospitals#index', as: 'root'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
