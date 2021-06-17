Rails.application.routes.draw do
  # namespace :api do
  #   get 'comments/create'
  # end
  mount_devise_token_auth_for 'User', at: 'auth/api'
  namespace :api do
    resources :articles, only: [:index, :show] do
      resources :comments, only: :create
    end
  end
end
