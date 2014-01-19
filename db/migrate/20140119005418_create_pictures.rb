class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :user
      t.text :description

      t.timestamps
    end
    add_index :pictures, :user_id
  end
end
