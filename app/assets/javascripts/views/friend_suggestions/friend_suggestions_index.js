FacebookClone.Views.FriendsSuggestionsIndex = Backbone.View.extend({

  template: JST['friend_suggestions/index'],

  events: {
    "click a.request-friend": "requestFriend"
  },

  initialize: function() {
  },

  render: function() {
    this.$el.html(this.template({ suggestions: this.collection }));
    return this;
  },

  // UNFINISHED AND WILL NOT WORK
  requestFriend: function(event) {
    event.preventDefault();

    var userId = $(event.currentTarget).attr('user-id');

    var newFriendRequest = new FacebookClone.Models.FriendRequest({
      user_id: userId
    });

    newFriendRequest.save();

    this.collection.remove(userId);
    this.render();
  }

});
