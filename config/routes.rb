Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'
  devise_for :trainers
  resources :trainers

  patch 'pokemons/capture', to: 'pokemons#capture', as: 'capture'
  patch 'pokemons/damage', to: 'pokemons#damage', as: 'damage'

  resources :pokemons
end
