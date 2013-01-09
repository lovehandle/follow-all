jQuery () ->
  if $("#follow-all-twitter").length > 0
    model = new FA.Models.Twitter.FollowAll
    view  = new FA.Views.Twitter.FollowAll { model: model }
    view.render()

    FA.currentView = view
