module PostsHelper
  def latest_posts
    Post.published.first(5)
  end
end
