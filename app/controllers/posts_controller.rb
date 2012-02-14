class PostsController < ApplicationController
  load_resource

  def index
    @posts = @posts.published.page(params[:page])
  end

  def show
  end
end
