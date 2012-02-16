Jbhannah::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  resources :posts, path: '/blog', only: [:index, :show] do
    get '(archive/:year(/:month(/:day)))(/page/:page)', action: :index, on: :collection, constraints: {
      year:  /\d{4}/,
      month: /\d{2}/,
      day:   /\d{2}/,
      page:  /\d+/
    }
  end

  match '/go/:key' => 'welcome#redirect', as: :redirect

  root to: 'welcome#index'
end
