Rails.application.routes.draw do

  get 'ideas/:id' => 'ideas#show'

  post 'users' => 'users#create'

  get 'users/:id' => 'users#show'

  post 'sessions' => 'sessions#create'

  get 'logout' => 'sessions#destroy'

  get 'main' => 'users#index'

  get 'bright_ideas' => 'ideas#index'

  get 'bright_ideas/:id' => 'ideas#show'

  post 'ideas' => 'ideas#create'

  delete 'ideas/:id' => 'ideas#destroy'

  post 'likes' => 'likes#create'
  
  root 'users#index'

end
