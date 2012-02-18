class PostSweeper < ActionController::Caching::Sweeper
  observe Post

  def after_create(post)
    expire_cache_for(post)
  end

  def after_update(post)
    expire_cache_for(post)
  end

  def after_destroy(post)
    expire_cache_for(post)
  end

  private
  def expire_cache_for(post)
    # Currently, there's no way to run expire_action from a sweeper
    # triggered by rails_admin. Ideally, this would run:

    # expire_fragment "latest_posts"
    # expire_fragment "post_months"
    # expire_action controller: "/posts", action: :index
    # expire_action controller: "/posts", action: :show, id: post.slug

    # Instead, it's easier to just clear the entire cache for now.
    Rails.cache.clear
  end
end
