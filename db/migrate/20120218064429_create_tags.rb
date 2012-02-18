class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end

    create_table :posts_tags, id: false do |t|
      t.references :post
      t.references :tag
    end

    add_index :posts_tags, [:post_id, :tag_id], unique: true
  end
end
