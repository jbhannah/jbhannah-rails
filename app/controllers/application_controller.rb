class ApplicationController < ActionController::Base
  protect_from_forgery
  cache_sweeper :post_sweeper

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path
  end
end
