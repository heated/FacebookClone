FacebookClone.Models.Comment = Backbone.Model.extend({
  urlRoot: "comments",

  parse: function(data) {
    data.user = new FacebookClone.Models.User(data.user);
    return data;
  }
});
