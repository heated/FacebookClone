FacebookClone.Models.Post = Backbone.Model.extend({
  urlRoot: "posts",

  parse: function(data) {
    data.user = new FacebookClone.Models.User({ id: data.user_id });
    //data.comments = new FacebookClone.Collection.Comments();

    // LOAD MOTHERFUCKING COMMENTS
    // NEW COMMENTS COLLECTION
    //  FETCH
    // ^^ NOPE
    // FACEBOOKCLONE.COLLL
    // COMMENTS INDEX

    return data;
  }
});
