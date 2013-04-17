Todomvc.Views.Todos ||= {}

class Todomvc.Views.Todos.IndexView extends Backbone.View
  template: JST["backbone/templates/todos/index"]

  events:
    "submit #new_todo": "onNewTodo"

  initialize: ->
    @options.todos.bind('reset', @addAll)

  # New item
  onNewTodo: (ev)->
    pp 'onNewTodo'
    ev.preventDefault();

    # Serialize form
    attrs =
      title: @$("#todo_title").val()

    # Reset form
    @$("#new_todo")[0].reset();

    # Create model
    @options.todos.create attrs,
      success: (todo) =>
        @addOne(todo)

  addAll: =>
    @options.todos.each(@addOne)

  addOne: (todo) =>
    view = new Todomvc.Views.Todos.TodoView({model : todo})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(todos: @options.todos.toJSON() ))
    @addAll()

    return this
