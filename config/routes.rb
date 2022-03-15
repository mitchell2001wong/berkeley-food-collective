Rails.application.routes.draw do
  resources :usr_emails
  get 'verify' => 'usr_emails#verifyshow'
  post 'verify' => 'usr_emails#verify'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'sessions#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :announcements
  resources :tasks
end
