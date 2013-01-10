class FA.Models.Twitter.User extends Backbone.Model

  defaults:
    name: undefined
    full_name: undefined
    url: undefined

  imageUrl: () ->
    "https://api.twitter.com/1/users/profile_image?screen_name=#{ @get("screen_name") }&size=bigger"
