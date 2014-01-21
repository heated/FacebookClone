FacebookClone.Views.FriendRequestsIndex = Backbone.View.extend({
  template: JST['friend_requests/index'],

  events: {
    "click a.confirm-friend": "confirmFriend"
  },

  render: function() {
    this.$el.html(this.template({ requests: this.collection }));
    return this;
  },

  confirmFriend: function(event) {
    event.preventDefault();
    var link = $(event.currentTarget);
    userId = link.attr('user-id');

    var newFriend = new FacebookClone.Models.Friend({ 
      user_id: userId
    });
    var request = this.collection.get(userId);

    var that = this;
    newFriend.save({}, {
      success: function(response) {
        this.collection.remove(request);
        this.render();
      }.bind(this)
    });
  }
});
