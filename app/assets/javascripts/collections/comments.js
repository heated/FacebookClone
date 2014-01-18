FacebookClone.Collections.Comments = Backbone.Collection.extend({

  model: FacebookClone.Models.Comment,

  url: "comments",

  parse: function(data) {
    console.log(data);
    return data;
  }

});
