Jbhannah::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  resources :posts, only: [:index, :show] do
    get '/page/:page', on: :collection, action: :index
  end

  match '/go/:key' => 'welcome#redirect', as: :redirect

  root to: 'welcome#index'
end
