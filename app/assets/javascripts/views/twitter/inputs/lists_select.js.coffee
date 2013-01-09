class FA.Views.Twitter.ListsSelect extends Backbone.View

  el: "#follow-all-twitter-list"

  events:
    "change #follow-all-twitter-list-input" : "onListChange"

  initialize: () ->
    @collection.on "reset", @render, @

  render: () ->
    @$el.html JST["twitter/lists_select"] { lists: @collection }

  onListChange: (e) ->
    $select = $(e.target)
    @model.set { list: $select.val() }
