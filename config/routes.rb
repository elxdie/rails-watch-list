Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # home page
  root to: 'lists#index'
  resources :lists, except: [:edit, :update] do
    # as bookmarks belong to lists
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: :destroy

  # get 'lists', to: 'lists#index'
  # get 'lists/new', to: 'lists#new', as: :new_list
  # post 'lists', to: 'lists#create'
  # get 'lists/:id', to: 'lists#show', as: :list
end
