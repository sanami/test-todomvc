class Todomvc.Routers.TodosRouter extends Backbone.Router
  initialize: (options) ->
    @todos = new Todomvc.Collections.TodosCollection()
    @todos.fetch reset: true

  routes:
    ".*"        : "index"

  index: ->
    @view = new Todomvc.Views.Todos.IndexView(todos: @todos)
    $("#todos").html(@view.render().el)
