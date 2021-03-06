class Friendship < ActiveRecord::Base
  belongs_to :user_from,
             :class_name => "User"
  belongs_to :user_to,
             :class_name => "User"
  attr_accessible :user_from_id, :user_to_id

  def self.find_by_ids(id1, id2)
    [self.find_by_user_from_id_and_user_to_id(id1, id2),
     self.find_by_user_from_id_and_user_to_id(id2, id1)]
  end

  def self.exists?(id1, id2)
    self.find_by_user_from_id_and_user_to_id(id1, id2)
  end

  def self.create_both!(id1, id2)
    Friendship.create! :user_from_id => id1,
                         :user_to_id => id2
    Friendship.create! :user_from_id => id2,
                         :user_to_id => id1
  end
end
