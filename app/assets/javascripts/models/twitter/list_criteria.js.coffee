class FA.Models.Twitter.ListCriteria extends Backbone.Model

  defaults:
    user: undefined
    list: undefined

  validate: (attrs) ->
    if @hasChanged("user") && _.isEmpty(attrs.user)
      return "user may not be blank"
    if @hasChanged("list") && _.isEmpty(attrs.list)
      return "list may not be blank"
