Todomvc.Views.Todos ||= {}

class Todomvc.Views.Todos.TodoView extends Backbone.View
  template: JST["backbone/templates/todos/todo"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  initialize: ->
    # Redraw on model change
    @model.on 'change', @render
    @model.on 'remove', @remove_view

  destroy: ->
    pp 'destroy'
    @model.destroy()

    return false

  remove_view: =>
    pp 'remove'
    @remove()

  render: =>
    @$el.html(@template(@model.toJSON() ))
    return this
