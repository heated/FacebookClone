FacebookClone.Views.FriendSuggestionsIndex = Backbone.View.extend({

  template: JST['friend_suggestions/index'],

  events: {
    "click a.request-friend": "requestFriend"
  },

  render: function() {
    this.$el.html(this.template({ suggestions: this.collection }));
    return this;
  },

  // UNFINISHED AND WILL NOT WORK
  requestFriend: function(event) {
    event.preventDefault();

    var newFriendRequest = new FacebookClone.Models.FriendRequest({
      user_id: this.model.id
    });

    var that = this;
    newFriendRequest.save();

    that.collection.remove();
  }

});
