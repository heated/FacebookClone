FacebookClone.Views.UserShow = Backbone.View.extend({

  template: JST['users/show'],

  render: function () {
    this.$el.html(this.template({ post: this.model }));
    return this;
  }

});
