class WelcomeController < ApplicationController
  def index
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
