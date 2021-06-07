Rails.application.routes.draw do
  devise_for :admins, controllers:{
    sessions: 'admins/sessions'
  }
  get "admin" => 'admin/homes#top'
  get "about" => "admin/homes#about"
  namespace :admin do
  resources :users, only:[:index, :show] do
    collection do
      get 'search'
  end
end
  resources :posts, only:[:index, :show, :destroy]do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only:[:create, :destroy]
    collection do
      get 'search'
  end
  end
  resources :pets, only:[:index, :show, :destroy] do
   collection do
      get 'search'
  end
end
  end
  
  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'user/homes#top'
  scope module: 'user' do
  resources :posts, only:[:new, :show, :index, :create, :destroy] do
    resource :favorites, only: [:create, :destroy]
   resources :comments, only:[:create, :destroy]
   collection do
      get 'search'
  end
end
  resources :users, only:[:show, :update, :edit, :index] do
     collection do
      get 'search'
  end
end
  resources :pets, only:[:new, :show, :index, :create, :update, :edit] do
   collection do
      get 'search'
  end
end
end
end
