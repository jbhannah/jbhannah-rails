class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.references :user
      t.text :body
      t.boolean :published

      t.timestamps
    end
    add_index :posts, :user_id
  end
end
