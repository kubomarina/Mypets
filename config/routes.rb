Rails.application.routes.draw do
  devise_for :admins, controllers:{
    sessions: 'admins/sessions'
  }
  get "admin" => 'admin/homes#top'
  get "about" => "admin/homes#about"

  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'user/homes#top'
  scope module: 'user' do
  resources :posts, only:[:new, :show, :index, :create, :destroy] do
    resource :favorites, only: [:create, :destroy]
   resources :comments, only:[:create, :destroy]
  end
  resources :users, only:[:show, :update, :edit]
  resources :pets, only:[:new, :show, :index, :create, :update, :edit]
  end


end
