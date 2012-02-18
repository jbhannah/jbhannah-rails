class PostsController < ApplicationController
  load_and_authorize_resource find_by: :slug
  caches_action :index, :show, layout: false, cache_path: lambda { |c| c.params }

  def index
    if params[:year]
      @date = Time.new(params[:year], params[:month], params[:day])

      if params[:month]
        if params[:day]
          @posts = @posts.by_day(params[:year], params[:month], params[:day])
        else
          @posts = @posts.by_month(params[:year], params[:month])
        end
      else
        @posts = @posts.by_year(params[:year])
      end
    end

    @posts = @posts.page(params[:page])
  end

  def show
  end
end
