FacebookClone.Views.MessagesIndex = Backbone.View.extend({
  template: JST['messages/index'],

  events: {
    "submit form#new-message": "createMessage"
  },

  render: function() {
    this.$el.html(this.template({ messages: this.collection }));
    return this;
  },

  createMessage: function(event) {
    event.preventDefault();
    var attrs = $(event.currentTarget).serializeJSON().message;
    var newMessage = new FacebookClone.Models.Message(attrs);

    var that = this;
    newMessage.save({}, {
      success: function(response) {
        that.collection.add(newMessage);
        that.render();
      }
    });
  }
});
