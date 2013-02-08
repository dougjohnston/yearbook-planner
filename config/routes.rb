YearbookPlanner::Application.routes.draw do
  devise_for :users

  resources :schools
  resources :users
  resources :yearbooks
  resources :assignments
  resources :deadlines
  resources :events
  resources :sections
  resources :spreads
  resources :pages

  resources :yearbooks, :shallow => true do
    resources :sections do
      resources :spreads do
        resources :pages
      end
    end
  end

  # Additional support routes
  resource :configuration, :controller => 'configuration'
  resource :dashboard, :controller => 'dashboard'
  resource :static, :controller => 'static'

  # Match subdomains and redirect to the dashboard
  constraints(Subdomain) do
    match '/' => 'dashboard#show'
  end

  root :to => 'public#index'
end
