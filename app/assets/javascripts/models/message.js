FacebookClone.Models.Message = Backbone.Model.extend({
  urlRoot: "api/private_messages",

  parse: function(data) {
    data.user_from = new FacebookClone.Models.User(data.user_from);
    data.user_to = new FacebookClone.Models.User(data.user_to);

    return data;
  }
});
