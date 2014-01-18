FacebookClone.Models.Post = Backbone.Model.extend({
  urlRoot: "posts",

  parse: function(data) {
    data.user = new FacebookClone.Models.User(data.user);
    data.comments = new FacebookClone.Collections.Comments(data.comments);
    console.log(data.comments)
    //data.comments.parse(data.comments); // DOES NOTHING
    
    return data;
  }
});
