FacebookClone.Views.FriendFinder = Backbone.View.extend({
  initialize: function() {
    this.$el.width(250);

    var requests = new FacebookClone.Collections.FriendRequests();
    this.requests_view = new FacebookClone.Views.FriendRequestsIndex({
      collection: requests
    });

    var suggestions = new FacebookClone.Collections.FriendsSuggestions();
    this.suggestions_view = new FacebookClone.Views.FriendsSuggestionsIndex({
      collection: suggestions
    });
    
    suggestions.fetch();
    requests.fetch({
      success: this.render.bind(this)
    });

    this.bindPopover();
  },

  render: function() {
    this.$el.html(this.requests_view.render().$el);
    this.$el.append(this.suggestions_view.render().$el);
    return this;
  },

  bindPopover: function() {
    $('#find-friends-button').popover({
      content: this.$el,
      html: true,
      placement: 'bottom'
    });

    $('#find-friends-button').click(function(event) {
      event.preventDefault();
    });

    $('#content').click(function() {
      $('#find-friends-button').popover('hide');
    });
  }
});
