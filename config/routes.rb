Rails.application.routes.draw do
  root to: 'recipes#home'

  devise_for :users,
    controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :recipes do
    member do
      post :fork
      get :fork_history, to: 'recipes#fork_history', as: :fork_history
    end
  end
  get '/recipes/:id' => 'recipes#show'

  resources :tags, only: [:show]
  resources :users, only: [:show] do
    member do
      get '/:slug' => 'users#show'
    end
  end
end
