class FA.Views.Flashes extends Backbone.View

  el: "#flash"

  flash: (type, message) ->
    @$el.html JST["flashes"] { type: type, message: message }
    @$el.show()
    window.setTimeout _.bind((() -> @$el.hide("fade")), @), 5000
