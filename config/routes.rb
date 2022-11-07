Rails.application.routes.draw do
  
  get 'sessions/new'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # hello world
  # root "application#hello"

  root "pages#home"
  get 'home' => 'pages#home'

  get 'play' => 'pages#play'
  get 'game' => 'pages#game'

  get 'signup'  => 'users#new'

  get 'signin'   => 'sessions#new'
  post 'signin'   => 'sessions#create'
  delete 'signout'  => 'sessions#destroy'

end
