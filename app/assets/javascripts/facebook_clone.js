window.FacebookClone = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {

    this.posts = new FacebookClone.Collections.Posts();

    new FacebookClone.Routers.MainRouter({
      $rootEl: $("#content")
    });

    this.posts.fetch({
      success: function() {
        Backbone.history.start();
      }
    })
  }
};
