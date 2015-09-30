Rails.application.routes.draw do
  
  get 'items/create'

  get 'about' => 'welcome#about'
  get 'welcome' => 'welcome#index'
  root to: 'welcome#index'

  devise_for :users
  
resources :items

end
