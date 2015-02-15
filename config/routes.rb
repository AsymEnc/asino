Rails.application.routes.draw do
  devise_for :users, skip: :registration

  root 'static_pages#main'

  match '/search', to: 'static_pages#search', via: 'get'
  match '/help',   to: 'static_pages#help',   via: 'get'
  match '/about',  to: 'static_pages#about',  via: 'get'

  resources :documents
end
