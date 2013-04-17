class Todomvc.Routers.TodosRouter extends Backbone.Router
  routes:
    ".*"        : "index"

  initialize: (options) ->
    @todos = new Todomvc.Collections.TodosCollection()
    @onTimer()

    setInterval @onTimer, 1000

  # Request data
  onTimer: =>
    $.getJSON "/todos/", {"since": @todos.since}, (json) =>
      #pp "getJSON", json
      @todos.parse_server_data(json)

  # Default view
  index: ->
    @view = new Todomvc.Views.Todos.IndexView(todos: @todos)
    $("#todos").html(@view.render().el)
