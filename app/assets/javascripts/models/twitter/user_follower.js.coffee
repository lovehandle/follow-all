class FA.Models.Twitter.UserFollower extends Backbone.Model

  initialize: () ->
    @lists    = new FA.Collections.Twitter.Lists
    @users    = new FA.Collections.Twitter.Users
    @criteria = new FA.Models.Twitter.ListCriteria

    @lists.fetch()

    @criteria.bind "change", @onCriteriaChange, @

  onCriteriaChange: () ->
    @users.fetch {
      data: {
        users: @criteria.toJSON()
      }
    }
