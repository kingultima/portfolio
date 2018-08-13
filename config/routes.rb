Rails.application.routes.draw do
	devise_for :users
	resources :hospitals
	get 'map/index', as: 'maps'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
