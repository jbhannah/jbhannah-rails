class AddSlugToPosts < ActiveRecord::Migration
  class Post < ActiveRecord::Base
  end

  def up
    add_column :posts, :slug, :string
    add_index  :posts, :slug, unique: true

    Post.all.each { |p| p.update_attribute(:slug, p.title.parameterize) }
  end

  def down
    remove_index  :posts, :slug
    remove_column :posts, :slug, :string
  end
end
