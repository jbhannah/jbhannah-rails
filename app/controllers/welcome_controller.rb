class WelcomeController < ApplicationController
  def index
    d  = Time.now
    bd = Time.new(1989, 3, 20)

    @age = d.year - bd.year
    @age = @age - 1 if (
       bd.month >  d.month or 
      (bd.month >= d.month and bd.day > d.day)
    )
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
