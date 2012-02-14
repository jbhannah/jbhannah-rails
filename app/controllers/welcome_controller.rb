class WelcomeController < ApplicationController
  caches_action :index

  def index
    @posts = Post.published.first(5)
  end

  def redirect
    key = params[:key]

    if Settings.social[key]
      redirect_to Settings.social[key]["url"], status: :moved_permanently
    else
      raise ActionController::RoutingError.new("Invalid key")
    end
  end
end
