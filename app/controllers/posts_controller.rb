class PostsController < ApplicationController
  load_resource
  caches_action :index, :show

  def index
    @posts = @posts.published.page(params[:page])
  end

  def show
  end
end
