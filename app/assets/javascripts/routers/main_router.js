FacebookClone.Routers.MainRouter = Backbone.Router.extend({
  routes: {
    "": "index",
    "messages": "messagesIndex",
    ":id": "userProfile"
  },

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
  },

  index: function() {
    console.log(FacebookClone.currentUser.id);
    Backbone.history.navigate("messages");
  },

  userProfile: function(id) {
    var that = this;
    var user = new FacebookClone.Models.User({ id: id });

    user.fetch({
      success: function() {
        var view = new FacebookClone.Views.UserShow({ model: user });
        that._swapView(view);
      }
    });
  },

  messagesIndex: function() {
    var that = this;
    var messages = new FacebookClone.Collections.Messages();

    messages.fetch({
      success: function() {
        var view = new FacebookClone.Views.MessagesIndex({ 
          collection: messages
        });
        that._swapView(view);
      }
    });
  },

  _swapView: function (view) {
    this._current_view && this._current_view.remove();
    this._current_view = view;
    this.$rootEl.html(view.render().$el);
  }
});
