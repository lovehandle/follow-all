class FA.Views.Twitter.Users extends Backbone.View

  el: "#twitter-list-users"

  initialize: () ->
    @collection.bind "reset", @render, @
    @collection.bind "fetch", @loading, @

  render: () ->
    @$el.html JST["twitter/users"] { users: @collection }
