FacebookClone.Views.UserShow = Backbone.View.extend({

  template: JST['users/show'],

  events: {
    "click a.request-friend": "requestFriend"
  },

  render: function () {
    var posts = new FacebookClone.Collections.Posts(
      this.model.get('wall_posts'),
      { parse: true }
    );

    var view = new FacebookClone.Views.PostsIndex({ collection: posts });

    this.$el.html(this.template({ 
      user: this.model 
    }));

    this.$el.append(view.render().$el);

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
