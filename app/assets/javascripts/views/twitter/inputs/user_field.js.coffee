class FA.Views.Twitter.UserField extends Backbone.View

  el: "#follow-all-twitter-user"

  events:
    "change #follow-all-twitter-user-input" : "onUserChange"

  render: () ->
    @$el.html JST["twitter/user_field"]

  onUserChange: (e) ->
    $input = $(e.target)
    @model.set { user: $input.val() }
