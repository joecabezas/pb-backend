Rails.application.routes.draw do
  resources :disorders
  resources :frequencies
  resources :hpos
  resources :groups
  resources :types

  post 'with_hpo_ids', to: 'disorders#with_hpo_ids'
end
