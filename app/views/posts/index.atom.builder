atom_feed do |feed|
  feed.title(Settings.name)
  feed.updated(@posts.first.published_at)

  @posts.each do |post|
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(post.body, format: 'html')

      entry.author do |author|
        author.name(post.user.to_s)
      end
    end
  end
end
