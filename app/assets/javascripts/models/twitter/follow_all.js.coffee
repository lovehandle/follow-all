class FA.Models.Twitter.FollowAll extends Backbone.Model

  url: "/twitter/users/follow_users"

  initialize: () ->
    @criteria = new FA.Models.Twitter.Criteria
    @lists    = new FA.Collections.Twitter.Lists
    @users    = new FA.Collections.Twitter.Users

    @criteria.on "change:user", @onUserChange, @
    @criteria.on "change:list", @onListChange, @

  onUserChange: () ->
    @lists.fetch {
      data: {
        user: @criteria.get("user")
      }
    }

  onListChange: () ->
    @users.fetch {
      data: {
        user: @criteria.get("user")
        list: @criteria.get("list")
      }
    }

  followUsers: () ->
    $.ajax {
      type: "POST"
      beforeSend: (xhr) ->
        xhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')
      url: @url
      data: {
        users: @users.toJSON()
      }
      success: _.bind(@onSuccess, @)
      error:   _.bind(@onError, @)
    }

  onSuccess: () ->
    @trigger "follow_users:success"

  onError: () ->
    @trigger "follow_users:error"
