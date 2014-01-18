window.FacebookClone = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    this.users = new FacebookClone.Collections.Users();
    this.messages = new FacebookClone.Collections.Messages();
    this.posts = new FacebookClone.Collections.Posts();

    var usersFetch = this.users.fetch();
    var messagesFetch = this.messages.fetch();
    var postsFetch = this.posts.fetch();

    $.when(
      usersFetch, messagesFetch, postsFetch
    ).then(function() {
      new FacebookClone.Routers.MainRouter({
        $rootEl: $('#content')
      });
      Backbone.history.start();
    });
  }
};
