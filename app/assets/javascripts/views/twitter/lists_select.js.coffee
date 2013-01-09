class FA.Views.Twitter.ListsSelect extends Backbone.View

  el: "#twitter-list"

  events:
    "change #twitter-list-input" : "onListChange"

  initialize: () ->
    @collection.bind "reset",  @render, @
    @model.bind "change:user", @render, @

  render: () ->
    user_screen_name = @model.get("user")
    @$el.html JST["twitter/lists_select"] {
      lists: @collection.listNamesByUserScreenName(user_screen_name)
    }

  onListChange: (e) ->
    $select = $(e.target)
    @model.set { list: $select.val() }
