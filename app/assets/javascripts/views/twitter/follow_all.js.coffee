class FA.Views.Twitter.FollowAll extends Backbone.View

  el: "#follow-all-twitter"

  events:
    "click #follow-all-btn" : "onSubmit"

  initialize: () ->
    @flashes     = new FA.Views.Flashes
    @userField   = new FA.Views.Twitter.UserField   { model: @model.criteria }
    @listsSelect = new FA.Views.Twitter.ListsSelect { model: @model.criteria, collection: @model.lists }
    @usersIndex  = new FA.Views.Twitter.UsersIndex  { collection: @model.users }

    @model.on "follow_users:success", @onSuccess, @
    @model.on "follow_users:error",   @onError,   @

  render: () ->
    @userField.render()
    @listsSelect.render()
    @usersIndex.render()

  onSubmit: () ->
    @model.followUsers()

  onSuccess: (response) ->
    @flash "notice", "You are now following these users."

  onError: (response) ->
    @flash "error", "You have been rate limited by Twitter. Please try again in an hour."

  flash: () ->
    @flashes.flash(arguments...)
