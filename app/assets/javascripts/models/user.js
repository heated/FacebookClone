FacebookClone.Models.User = Backbone.Model.extend({
  urlRoot: "api/users",

  parse: function(data) {
    data.wall_posts = new FacebookClone.Collections.Posts(
      data.wall_posts, { parse: true }
    );

    return data;
  },

  toJSON: function() {
    var data = _.clone(this.attributes);
    delete data.wall_posts;
    return data;
  }
});
