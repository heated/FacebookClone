class Api::GuestsController < ApplicationController
  def create
    @guest = User.find_by_email("guest@guest.com")
    log_in_user(@guest)
    redirect_to root_url
  end
end
