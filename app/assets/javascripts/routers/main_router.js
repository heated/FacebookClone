FacebookClone.Routers.MainRouter = Backbone.Router.extend({
  routes: {
    "": "postsIndex",
    "messages": "messagesIndex",
    "friends": "friendsIndex",
    "users/:id": "userProfile"
  },

  initialize: function() {
    this.$topBar = $('#top-bar');
    this.$rootEl = $('#content');
    this.$leftBar = $('#left-bar');
    this.$rightBar = $('#right-bar');
    new FacebookClone.Views.FriendFinder();
    this.initializeSearch();
  },

  index: function() {
    console.log(FacebookClone.currentUser.id);
  },

  userProfile: function(id) {
    var user = new FacebookClone.Models.User({ id: id });
    var view = new FacebookClone.Views.UserShow({ model: user });

    this._fetch_success(user, function() {
      this._swapView(view);
    }.bind(this));
  },

  messagesIndex: function() {
    var messages = new FacebookClone.Collections.Messages();
    var view = new FacebookClone.Views.MessagesIndex();

    this._fetch_success(messages, function() {
      view.collection = messages;
      this._swapView(view);
    }.bind(this));
  },

  postsIndex: function() {
    var posts = new FacebookClone.Collections.Posts();
    var view = new FacebookClone.Views.PostsIndex();

    this._fetch_success(posts, function() {
      view.collection = posts;
      this._swapView(view);
    }.bind(this));
  },

  friendsIndex: function() {
    var friends = new FacebookClone.Collections.Friends();
    var view = new FacebookClone.Views.FriendsIndex();

    this._fetch_success(friends, function(response) {
      view.collection = friends;
      this._swapView(view);
    }.bind(this));
  },

  friendRequestsIndex: function() {
    var requests = new FacebookClone.Collections.FriendRequests();
    var view = new FacebookClone.Views.FriendRequestsIndex();

    this._fetch_success(requests, function(response) {
      view.collection = requests;
      this._swapView(view);
    }.bind(this));
  },

  initializeSearch: function() {
    var searchBar = $('#search-bar');
    var searchForm = $('#search-form');
    var that = this;
    
    searchBar.typeahead({
      valueKey: 'name',
      prefetch: 'api/users',
      template: JST['users/list']
    });

    searchBar.on(
      'typeahead:selected typeahead:autocompleted', 
      function(e, datum) {
        searchBar.attr('data-id', datum.id);
      }
    );

    searchForm.submit(function(event) {
      event.preventDefault();
      var userId = searchBar.attr('data-id');
      that.userProfile(userId);
    });
  },

  _swapView: function (view) {
    this._current_view && this._current_view.remove();
    this._current_view = view;
    this.$rootEl.html(view.render().$el);
  },

  _fetch_success: function (obj, callback) {
    obj.fetch({
      success: callback
    });
  }
});
