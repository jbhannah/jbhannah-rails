Jbhannah::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  resources :posts, only: [:index, :show]

  match '/go/:key' => 'welcome#redirect', as: :redirect

  root to: 'welcome#index'
end
