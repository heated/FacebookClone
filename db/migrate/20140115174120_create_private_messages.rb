class CreatePrivateMessages < ActiveRecord::Migration
  def change
    create_table :private_messages do |t|
      t.references :user_from, :null => false
      t.references :user_to, :null => false
      t.text :body, :null => false

      t.timestamps
    end
    add_index :private_messages, :user_from_id
    add_index :private_messages, :user_to_id
    add_index :private_messages, [:user_from_id, :user_to_id], :unique => true
  end
end
