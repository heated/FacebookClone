FacebookClone.Routers.MainRouter = Backbone.Router.extend({
  routes: {
    "": "postsIndex",
    "messages": "messagesIndex",
    ":id": "userProfile"
  },

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
  },

  index: function() {
    console.log(FacebookClone.currentUser.id);
  },

  userProfile: function(id) {
    var that = this;
    var user = new FacebookClone.Models.User({ id: id });

    this._fetch_success(user, function() {
      var view = new FacebookClone.Views.UserShow({ model: user });
      that._swapView(view);
    });
  },

  messagesIndex: function() {
    var that = this;
    var messages = new FacebookClone.Collections.Messages();

    this._fetch_success(messages, function() {
      var view = new FacebookClone.Views.MessagesIndex({
        collection: messages
      });
      that._swapView(view);
    });
  },

  postsIndex: function() {
    var that = this;
    var posts = new FacebookClone.Collections.Posts();

    this._fetch_success(posts, function() {
      var view = new FacebookClone.Views.PostsIndex({
        collection: posts
      });
      that._swapView(view);
    });
  },

  _swapView: function (view) {
    this._current_view && this._current_view.remove();
    this._current_view = view;
    this.$rootEl.html(view.render().$el);
  },

  _fetch_success: function (obj, callback) {
    obj.fetch({
      success: callback
    });
  }
});
