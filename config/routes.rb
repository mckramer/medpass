Medpass::Application.routes.draw do
  # Sites and divisions
  resources :sites do
    resources :divisions
  end
  resources :roles
  
  # Data
  resources :allergens
  resources :conditions
  # resources :procedures
  resources :drugs do
    resources :indications
    resources :dosages
  end

  # Devise and resources for user
  devise_for :users, :path => 'accounts'
  resources :users do
    resources :allergies
    #resources :diagnoses
    #resources :prescriptions
  end
  
  # Helpers for users
  match "/participants/:id" => "Users#show"
  match "/providers/:id" => "Users#show"

  # Static pages
  match 'about' => 'page#about'
  match 'contact' => 'page#contact'
  
  # Root of site
  root :to => "page#home"

end
