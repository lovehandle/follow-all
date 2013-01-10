class FA.Models.Twitter.User extends Backbone.Model

  imageUrl: () ->
    "https://api.twitter.com/1/users/profile_image?screen_name=#{ @get("screen_name") }&size=bigger"

  url: () ->
    "https://twitter.com/#{ @get("screen_name") }"
