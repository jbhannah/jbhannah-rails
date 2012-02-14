class PostsController < ApplicationController
  load_resource

  def index
    @posts = @posts.page(params[:page])
  end

  def show
  end
end
