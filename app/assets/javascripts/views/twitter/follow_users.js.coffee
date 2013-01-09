class FA.Views.Twitter.FollowUsers extends Backbone.View

  el: "#main"

  initialize: () ->
    list_data    = { collection: @model.lists, model: @model.criteria }
    @usersSelect = new FA.Views.Twitter.UsersSelect list_data
    @listsSelect = new FA.Views.Twitter.ListsSelect list_data
    @users       = new FA.Views.Twitter.Users { collection: @model.users }

  render: () ->
    @usersSelect.render()
    @users.render()
