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
    var form = $(event.currentTarget);
    var that = this;

    var newMessage = new FacebookClone.Models.Message({
      name: form.find('#name').val(),
      body: form.find('#body').val()
    });

    newMessage.save({}, {
      success: function(response) {
        that.collection.add(newMessage);
        that.render();
      }
    });
  }
});
