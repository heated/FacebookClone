FacebookClone.Views.PostsIndex = Backbone.View.extend({

  template: JST['posts/index'],

  events: {
    "submit form#new-post": "createPost",
    "submit form.new-comment": "createComment"
  },

  render: function() {
    this.$el.html(this.template({ posts: this.collection }));
    return this;
  },

  createPost: function(event) {
    event.preventDefault();
    var attrs = $(event.currentTarget).serializeJSON().post;
    var newPost = new FacebookClone.Models.Post(attrs);

    var that = this;
    newPost.save({}, {
      success: function(response) {
        that.collection.add(newPost);
        that.render();
      }
    });
  },

  createComment: function(event) {
    event.preventDefault();
    var attrs = $(event.currentTarget).serializeJSON().comment;
    var newComment = new FacebookClone.Models.Comment(attrs);
    
    var that = this;
    newComment.save({}, {
      success: function(response) {
        that.collection
          .get(attrs.post_id)
          .get('comments')
          .add(newComment);
        that.render();
      }
    });
  }
});
