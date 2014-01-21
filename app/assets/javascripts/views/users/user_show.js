FacebookClone.Views.UserShow = Backbone.View.extend({

  template: JST['users/show'],

  events: {
    "click a.request-friend": "requestFriend"
  },

  render: function () {
    this.$el.html(this.template({ user: this.model }));
    return this;
  },

  requestFriend: function(event) {
    event.preventDefault();

    var newFriendRequest = new FacebookClone.Models.FriendRequest({
      user_id: this.model.id
    });

    var that = this;
    newFriendRequest.save({}, {
      success: function(response) {
        that.model.set('requested', true);
        that.render();
      }
    });
  }

});
