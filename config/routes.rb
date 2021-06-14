Rails.application.routes.draw do
  devise_for :admins, controllers:{
    sessions: 'admins/sessions'
  }
  get "admin" => 'admin/homes#top'
  get 'admin_ranking' => "admin/posts#ranking"
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
  get 'ranking' => "user/posts#ranking"
  get "about" => "user/homes#about"
  root 'user/homes#top'
  scope module: 'user' do
  resources :posts, only:[:new, :show, :create, :destroy] do
    resource :favorites, only: [:create, :destroy]
   resources :comments, only:[:create, :destroy]
   resources :tags
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
