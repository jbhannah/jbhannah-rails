class AddSlugToTags < ActiveRecord::Migration
  class Tag < ActiveRecord::Base
  end

  def up
    add_column :tags, :slug, :string
    add_index  :tags, :slug, unique: true

    Tag.all.each { |t| t.update_attribute(:slug, t.name.parameterize) }
  end

  def down
    remove_index  :tags, :slug
    remove_column :tags, :slug, :string
  end
end
