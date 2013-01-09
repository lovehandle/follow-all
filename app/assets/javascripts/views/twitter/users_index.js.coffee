class FA.Views.Twitter.UsersIndex extends Backbone.View

  el: "#follow-all-users-index"

  initialize: () ->
    @collection.bind "reset", @render, @
    @collection.bind "fetch", @loading, @

  render: () ->
    @$el.html JST["twitter/users_index"] { users: @collection }
