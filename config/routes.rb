Rails.application.routes.draw do
  devise_for :users
  root to: "categories#index"
  resources :users, only: [:edit, :update]
  resources :categories, only: [:new, :create]
  resources :banks, only: [:new, :create, :destroy, :edit, :update] do
    resources :contents, only: [:index, :create, :new]
  end

  resources :banks, only: [:new, :create, :destroy, :edit, :update] do
    resources :categories, only: [:new, :create] do
      resources :contents, only: [:index, :create, :new]
    end
  end
end
