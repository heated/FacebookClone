FacebookClone.Models.Message = Backbone.Model.extend({
  urlRoot: "private_messages",

  parse: function(data) {
    data.user_from = FacebookClone.users.get(data.user_from_id);
    data.user_to = FacebookClone.users.get(data.user_to_id);

    return data;
  }
});
