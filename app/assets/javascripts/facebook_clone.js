window.FacebookClone = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new FacebookClone.Routers.MainRouter();
    Backbone.history.start();
  }
};
