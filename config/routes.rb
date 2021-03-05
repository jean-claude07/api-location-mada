Rails.application.routes.draw do
  resources :publications
  resources :likes
  resources :commentaires
  resources :locations
  resources :admins
  resources :produits
  resources :users
  post '/user_session', to: 'users#user_session'
  post '/admin_session', to: 'admins#admin_session'
  get '/user_counteur', to: 'users#counteur'
  get '/produit_conteur', to:  'produits#produitCount'
  get '/location_conteur', to: 'locations#countLocation'
  get '/contact_conteur', to: 'contacts#countContact'
  post '/user_search', to: 'users#search'
  post '/produit_search', to: 'produits#search'
  resources :contacts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
