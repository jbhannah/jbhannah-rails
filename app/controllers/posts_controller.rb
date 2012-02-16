class PostsController < ApplicationController
  load_and_authorize_resource
  caches_action :index, :show

  def index
    if params[:year]
      t = Time.utc(params[:year], params[:month], params[:day])
      @posts = @posts.where(published_at: t..(t + 1.year))
      @posts = @posts.where(published_at: t..(t + 1.month)) if params[:month]
      @posts = @posts.where(published_at: t..(t + 1.day))   if params[:day]
    end

    @posts = @posts.page(params[:page])
  end

  def show
  end
end
