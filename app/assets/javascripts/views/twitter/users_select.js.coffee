class FA.Views.Twitter.UsersSelect extends Backbone.View

  el: "#twitter-user"

  events:
    "change #twitter-user-input" : "onUserChange"

  initialize: () ->
    @collection.bind "reset", @render, @

  render: () ->
    @$el.html JST["twitter/users_select"] { users: @collection.userScreenNames() }

  onUserChange: (e) ->
    $select = $(e.target)
    @model.set { user: $select.val() }
