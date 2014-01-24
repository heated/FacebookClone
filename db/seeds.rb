# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

p num_users = 30
p post_amount = num_users * 3
p all_combinations = (num_users ** 2) / 2

pic = File.open("seed_images/#{rand(300..310)}.#{rand(1..10)}")
User.create!    :name => "guest",
               :email => "guest@guest.com",
            :password => "password",
              :gender => "Male",
            :birthday => "1990/1/1",
         :profile_pic => pic
pic.close

(num_users - 1).times do
  pic = File.open("seed_images/#{rand(300..310)}.#{rand(1..10)}")
  User.create!    :name => Faker::Name.name,
                 :email => Faker::Internet.email,
              :password => "password",
                :gender => (rand > 0.5) ? "Male" : "Female",
              :birthday => "2000/5/20",
           :profile_pic => pic
  pic.close
end

all_combinations.times do
  PrivateMessage.create! :user_from_id => rand(1..num_users),
                           :user_to_id => rand(1..num_users),
                                 :body => Faker::Lorem.sentence
end

post_amount.times do
  Post.create! :user_id => rand(1..num_users),
                  :body => Faker::Lorem.paragraph
end

(all_combinations / 4).times do
  begin
    FriendRequest.create! :user_from_id => rand(1..num_users),
                            :user_to_id => rand(1..num_users)
  rescue
    retry
  end
end

(all_combinations / 4).times do
  begin
    Friendship.create_both! rand(1..num_users),
                            rand(1..num_users)
  rescue
    retry
  end
end

all_combinations.times do
  begin
    Comment.create! :user_id => rand(1..num_users),
                    :post_id => rand(1..post_amount),
                       :body => Faker::Lorem.sentence
  end
end
