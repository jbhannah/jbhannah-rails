class PostSweeper < ActionController::Caching::Sweeper
  observe Post

  def after_create(post)
    expire_cache_for(post)
  end

  def after_update(post)
    expire_cache_for(post)
  end

  private
  def expire_cache_for(post)
    expire_fragment "post_months" 
    expire_fragment "latest_posts" 
    expire_fragment "post_#{post.id}"
    expire_fragment "header_#{main_app.post_path(post)}"
  end
end
