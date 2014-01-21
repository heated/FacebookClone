window.FacebookClone = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function(a) {
    new FacebookClone.Routers.MainRouter();
    Backbone.history.start();
  }
};
