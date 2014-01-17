FacebookClone.Views.UserShow = Backbone.View.extend({

  template: JST['users/show'],

  render: function () {
    this.$el.html(this.template({ user: this.model }));
    return this;
  }

});
