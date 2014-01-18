window.FacebookClone = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new FacebookClone.Routers.MainRouter({
      $rootEl: $('#content')
    });
    Backbone.history.start();
  }
};
