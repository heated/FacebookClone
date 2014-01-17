window.FacebookClone = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    FacebookClone.posts = [];
    
    new FacebookClone.Routers.MainRouter({
      $rootEl: $("#content")
    });
    Backbone.history.start();
  }
};
