PoolSites::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users
  root :to => "home#index"

  resources :dashboard, only: :index
  resources :home, only: :index
  resources :about, only: :index
  resources :mentors, only: :index
  resources :media, only: :index
  resources :business, only: :index
  resources :templates, only: [:index, :show]
  resources :contact, only: [:index, :create]
  resources :newsletters, only: :create
  resources :sites do
    post 'save_content', on: :member
    get 'preview', on: :member
    get 'publish', on: :member
  end


end
