Rails.application.routes.draw do
  resources :items, only: %i(index show) do
    collection do
      get :recommended
    end
  end

  root 'portal#show'

  resources :categories, only: %i(show) do
    resources :items, only: %i(index)
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
