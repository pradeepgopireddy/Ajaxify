Rails.application.routes.draw do
  resources :people
	get 'customers/check_email_present'
	get 'customers/check_mobile_present'
	get 'states/check_name_present'
	get 'states/get_cities'
	root to: 'customers#index'
  resources :customers
  resources :cities
  resources :states
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
