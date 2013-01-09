class FA.Models.Twitter.FollowAll extends Backbone.Model

  initialize: () ->
    @criteria = new FA.Models.Twitter.Criteria
    @lists    = new FA.Collections.Twitter.Lists
    @users    = new FA.Collections.Twitter.Users

    @criteria.on "change:user", @onUserChange, @

    onUserChange: () ->
      @lists.fetch {
        data: {
          user: @criteria.get("user")
        }
      }
