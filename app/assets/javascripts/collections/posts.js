FacebookClone.Collections.Posts = Backbone.Collection.extend({
  model: FacebookClone.Models.Post,

  url: "api/posts",

  comparator: function(model) {
    return Date.parse(model.get("created_at")) * -1
  }
});
