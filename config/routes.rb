Jbhannah::Application.routes.draw do
  match '/go/:key' => 'welcome#redirect', as: :redirect

  root to: 'welcome#index'
end
