# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :articles do
      resources :comments
      resources :ratings
    end
    root 'articles#index'
  end

  resources :articles, only: :show do
    resources :comments
    resources :ratings
  end

  root 'articles#index'
end
