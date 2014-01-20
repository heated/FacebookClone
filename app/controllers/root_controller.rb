class RootController < ApplicationController
  before_filter :must_be_logged_in

  def root
    # O Come All Ye Rails
    # Joyful and DRY,
    # O come ye, O come ye to Backbone.
    # Come and learn Him,
    # Born the King of Front-End;
    # O come, let us write Him,
    # O come, let us edit Him,
    # O come, let us finish Him,
    # Bootstrap the Lord.
  end
end
