Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :comments
  end

  root 'posts#index'

  namespace :admin do
    get :sign_up, to: 'users#new'
    post :sign_up, to: 'users#create'

    get :sign_in, to: 'sessions#new'
    post :sign_in, to: 'sessions#create'

    get :sign_out, to: 'sessions#destroy'

    resources :posts do
      collection do
        post :preview
      end
      resources :comments
    end

    root to: 'posts#index'
    end

end
