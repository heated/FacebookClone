FacebookClone.Views.FriendsIndex = Backbone.View.extend({
  template: JST['friends/index'],

  events: {
    "submit form#new-friend": "createFriend"
  },

  render: function() {
    this.$el.html(this.template({ friends: this.collection }));
    return this;
  },

  createFriend: function(event) {
    event.preventDefault();
    var attrs = $(event.currentTarget).serializeJSON().user;
    var newFriend = new FacebookClone.Models.Friend(attrs);

    var that = this;
    newFriend.save({}, {
      success: function(response) {
        that.collection.add(newFriend);
        that.render();
      }
    });
  }
});
