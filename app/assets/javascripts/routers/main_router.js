FacebookClone.Routers.MainRouter = Backbone.Router.extend({
  routes: {
    ":id": "index"
  },

  index: function() {
    // LOAD THE USER AND SHOW HIM
    var that = this;
    this._getPost(id, function(post) {
      var view = new FacebookClone.Views.UserShow({ model: user });
      that._swapView(view);
    });
  },

  _swapView: function (view) {
    this.$rootEl.empty().append(view.render().$el);
  }
});
