class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, :null => false
      t.text :body, :null => false
      t.references :user, :null => false

      t.timestamps
    end
    add_index :posts, :user_id
  end
end
