FacebookClone.Routers.MainRouter = Backbone.Router.extend({
  routes: {
    "": "index",
    ":id": "userProfile"
  },

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
  },

  index: function() {
    Backbone.history.navigate("/1");
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

  _swapView: function (view) {
    this.$rootEl.empty().append(view.render().$el);
  }
});
