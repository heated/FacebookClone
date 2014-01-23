class Api::FriendsSuggestionsController < ApplicationController
  before_filter :must_be_logged_in

  def index
    @suggestions = current_user.friends_of_friends
  end
end
