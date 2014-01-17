window.FacebookClone = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    this.users = new FacebookClone.Collections.Users();
    this.messages = new FacebookClone.Collections.Messages();
    this.posts = new FacebookClone.Collections.Posts();

    this.users.fetch();
    this.messages.fetch();

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
