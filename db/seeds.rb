# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  User.create! :name => "heated",
               :email => "heated",
               :password => "password",
               :gender => "Male",
               :birthday => "2000/5/20"

  User.create! :name => "alright",
               :email => "alright",
               :password => "password",
               :gender => "Male",
               :birthday => "2000/5/20"

  User.create! :name => "okay",
               :email => "okay",
               :password => "password",
               :gender => "Male",
               :birthday => "2000/5/20"

  User.create! :name => "maybe",
               :email => "maybe",
               :password => "password",
               :gender => "Male",
               :birthday => "2000/5/20"

  PrivateMessage.create! :user_from_id => 1,
                         :user_to_id => 2,
                         :body => "You'er dumb!"

  PrivateMessage.create! :user_from_id => 2,
                         :user_to_id => 1,
                         :body => "No, your dumb11!"

  PrivateMessage.create! :user_from_id => 1,
                         :user_to_id => 4,
                         :body => "ur dum lol"

  PrivateMessage.create! :user_from_id => 4,
                         :user_to_id => 2,
                         :body => "omg y is"

  PrivateMessage.create! :user_from_id => 3,
                         :user_to_id => 4,
                         :body => "LOLOLOLWASONLYPRETENDING"

  Post.create! :user_id => 1,
               :title => "Title One",
               :body => "Body body body body body body body body body"

  Post.create! :user_id => 1,
               :title => "Title Two",
               :body => "Body body body body body body body body body"

  Post.create! :user_id => 2,
               :title => "Title Three",
               :body => "Body body body body body body body body body"

  Post.create! :user_id => 2,
               :title => "Title Four",
               :body => "Body body body body body body body body body"

  Post.create! :user_id => 3,
               :title => "Title Five",
               :body => "Body body body body body body body body body"

  Post.create! :user_id => 4,
               :title => "Title Six",
               :body => "Body body body body body body body body body"

end