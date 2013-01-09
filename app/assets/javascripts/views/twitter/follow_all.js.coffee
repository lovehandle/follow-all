class FA.Views.Twitter.FollowAll extends Backbone.View

  el: "#follow-all-twitter"

  initialize: () ->
    @userField   = new FA.Views.Twitter.UserField   { model: @model.criteria }
    @listsSelect = new FA.Views.Twitter.ListsSelect { model: @model.criteria, collection: @model.lists }
    @usersIndex  = new FA.Views.Twitter.UsersIndex  { collection: @model.users }

  render: () ->
    @userField.render()
    @listsSelect.render()
    @usersIndex.render()
