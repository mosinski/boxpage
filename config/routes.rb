Rails.application.routes.draw do
  resources :dashboards

  devise_for :users, controllers: {registrations: 'registrations', sessions: 'sessions'}
  root to: "static#start"
end
