FacebookClone.Views.UserShow = Backbone.View.extend({

  template: JST['users/show'],

  events: {
    "click button.request-friend": "requestFriend",
    "change input[type=file]": "encodeFile"
  },

  render: function () {
    var view = new FacebookClone.Views.PostsIndex({ 
      collection: this.model.get('wall_posts') 
    });

    this.$el.html(this.template({ 
      user: this.model 
    }));

    this.$el.append(view.render().$el);

    return this;
  },

  requestFriend: function(event) {
    event.preventDefault();

    var newFriendRequest = new FacebookClone.Models.FriendRequest({
      user_id: this.model.id
    });

    var that = this;
    newFriendRequest.save({}, {
      success: function(response) {
        that.model.set('requested', true);
        that.render();
      }
    });
  },

  encodeFile: function (event) {
    var that = this;
    var file = event.currentTarget.files[0];
    var reader = new FileReader();
    
    reader.onload = function(e) {
      that.model.set({ profile_pic: e.target.result });
      that.render();
      that.model.save();
    }

    reader.onerror = function(stuff) {
      console.log(stuff.getMessage())
    }

    reader.readAsDataURL(file);
  }

});
