class FA.Collections.Twitter.Lists extends Backbone.Collection

  model: FA.Models.Twitter.List

  url: "/twitter/lists"

  userScreenNames: () ->
    _(@map (list) -> list.get("user_screen_name")).uniq()

  findByUserScreenName: (user_screen_name) ->
    _(@where { user_screen_name: user_screen_name })

  listNamesByUserScreenName: (user_screen_name) ->
    @findByUserScreenName(user_screen_name).map (list) -> list.get("name")
