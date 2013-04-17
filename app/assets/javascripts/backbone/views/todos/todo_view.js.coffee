Todomvc.Views.Todos ||= {}

class Todomvc.Views.Todos.TodoView extends Backbone.View
  template: JST["backbone/templates/todos/todo"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  initialize: ->
    # Redraw on model change
    @model.on 'change', @render

  destroy: ->
    @model.destroy()
    this.remove()

    return false

  render: =>
    @$el.html(@template(@model.toJSON() ))
    return this
