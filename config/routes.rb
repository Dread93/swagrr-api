Rails.application.routes.draw do
  resources :breeds, only:[:index, :show]
  resources :feed, only:[:index]
  resources :hashtags, param: :name, only:[:index, :show]
  resources :dogs, param: :handle do
    collection do
      get :my_dogs
    end
    member do
      get :current_dog
      get :follow
      get :unfollow
    end
    resources :posts do
      resources :comments, only:[:create, :destroy, :update]
    end
  end
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
