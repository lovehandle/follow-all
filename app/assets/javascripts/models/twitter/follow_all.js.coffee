class FA.Models.Twitter.FollowAll extends Backbone.Model

  url: "/twitter/users/follow_all"

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
      url: @url
      data: {
        users: @users.toJSON()
      }
    }
