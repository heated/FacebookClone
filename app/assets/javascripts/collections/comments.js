FacebookClone.Collections.Comments = Backbone.Collection.extend({

  model: FacebookClone.Models.Comment,

  url: "comments",

  comparator: "created_at"

});
