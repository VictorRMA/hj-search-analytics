Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'articles#index'

  resources :articles, only: [:index]

  get 'search_articles', to: 'articles#search'

  get 'teste', to: 'articles#teste'
end
