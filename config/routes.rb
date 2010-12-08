SampleApp::Application.routes.draw do
  resources :microposts, :only => [:create, :destroy, :index]
  resources :sessions, :only => [:new, :create, :destroy]

  resources :users do
    resources :microposts, :only => [:index, :create, :destroy]
  end
  
  match '/contact', :to => 'pages#contact'
  match '/about', :to => 'pages#about'
  match '/help', :to => 'pages#help'
  
  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  root :to => 'pages#home'
end
