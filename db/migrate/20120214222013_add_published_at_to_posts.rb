class AddPublishedAtToPosts < ActiveRecord::Migration
  class Post < ActiveRecord::Base
  end

  def up
    add_column :posts, :published_at, :datetime

    Post.all.each do |post|
      post.update_attribute(:published_at, post.created_at) if post.published?
    end
  end

  def down
    remove_column :posts, :published_at
  end
end
