Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'sessions#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  post 'update' => 'user#airtable_update'
  post 'tasks/clear' => 'tasks#clear'
  post 'tasks/checkmark' => 'tasks#checkmark'
  delete 'logout' => 'sessions#destroy'
  resources :announcements
  resources :tasks
end
