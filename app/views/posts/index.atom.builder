atom_feed do |feed|
  feed.title   Settings.name
  feed.updated @posts.first.published_at if @posts.first

  @posts.each do |post|
    feed.entry post do |entry|
      entry.title     post.title
      entry.published post.published_at
      entry.content   post.body_html, type: 'html'

      entry.author do |author|
        author.name post.user.to_s
      end
    end
  end
end
