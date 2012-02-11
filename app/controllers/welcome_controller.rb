class WelcomeController < ApplicationController
  def index
  end

  def redirect
    key = params[:key]

    if Settings.social[key]
      redirect_to Settings.social[key]["url"]
    else
      raise ActionController::RoutingError
    end
  end
end
