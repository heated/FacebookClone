FacebookClone.Models.Post = Backbone.Model.extend({
  urlRoot: "posts",

  parse: function(data) {
    data.user = new FacebookClone.Models.User(data.user);
    data.comments = new FacebookClone.Collections.Comments(
      data.comments, { parse: true }
    );
    
    return data;
  }
});
