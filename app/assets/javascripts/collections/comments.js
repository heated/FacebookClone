FacebookClone.Collections.Comments = Backbone.Collection.extend({

  model: FacebookClone.Models.Comment,

  url: "api/comments",

  comparator: "created_at"

});
