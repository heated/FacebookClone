FacebookClone.Models.Comment = Backbone.Model.extend({
  urlRoot: "comments",

  initialize: function(data) {
    this.parse(data);
  },

  parse: function(data) {
    data.user = new FacebookClone.Models.User(data.user);
    console.log(data.user);
    return data;
  }
});
