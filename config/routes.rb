Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "categories#index"
  resources :users, only: [:index,:edit, :update, :destroy]
  resources :categories, only: [:new, :create, :destroy, :edit, :update]
  resources :banks, only: [:new, :create, :destroy, :edit, :update] do
    resources :contents, only: [:index, :create, :new, :edit, :update, :show]
  end
  resources :banks, only: [:new, :create, :destroy, :edit, :update] do
    resources :categories, only: [:new, :create, :destroy, :edit, :update] do
      resources :contents, only: [:index, :create, :new, :edit, :update]
    end
  end
  resources :categories, only: [:new, :create, :destroy, :edit, :update] do
      resources :contents, only: [:index, :create, :new, :edit, :update]
      get 'contents/index2' => 'contents#index2'
  end
  resources :categories, only: [:new, :create, :destroy, :edit, :update] do
    resources :banks, only: [:new, :create, :destroy, :edit, :update] do
      resources :contents, only: [:index, :create, :new, :edit, :update]
    end
  end
end
