Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "categories#index"
  resources :users, only: [:edit, :update]
  resources :categories, only: [:new, :create]
  resources :banks, only: [:new, :create, :destroy, :edit, :update] do
    resources :contents, only: [:index, :create, :new, :edit, :update, :show]
  end
  resources :banks, only: [:new, :create, :destroy, :edit, :update] do
    resources :categories, only: [:new, :create] do
      resources :contents, only: [:index, :create, :new, :edit, :update]
    end
  end
  resources :categories, only: [:new, :create] do
      resources :contents, only: [:index, :create, :new, :edit, :update]
      get 'contents/index2' => 'contents#index2'
  end
  resources :categories, only: [:new, :create] do
    resources :banks, only: [:new, :create, :destroy, :edit, :update] do
      resources :contents, only: [:index, :create, :new, :edit, :update]
    end
  end
end
