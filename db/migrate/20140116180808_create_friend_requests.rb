class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
      t.references :user_from, :null => false
      t.references :user_to, :null => false

      t.timestamps
    end
    add_index :friend_requests, :user_from_id
    add_index :friend_requests, :user_to_id
    add_index :friend_requests, [:user_from_id, :user_to_id], :unique => true
  end
end
