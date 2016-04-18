Rails.application.routes.draw do
  resources :dogs
  resources :dogs do
    resources :posts do
      resources :comments, only:[:create, :destroy, :update]
    end
  end
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
