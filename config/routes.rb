Rails.application.routes.draw do
  root 'pokemons#index'
  resources :pokemons, only: [:index, :show, :destroy]
  get 'search', to: 'pokemons#search'
end
