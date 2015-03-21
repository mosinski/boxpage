Rails.application.routes.draw do
  resources :dashboards
  #resources :users, only: [:show]
  match "profile" => "users#show", :as => 'profile', via: :get

  devise_for :users, controllers: {registrations: 'registrations', sessions: 'sessions'}
  root to: "static#start"
end
