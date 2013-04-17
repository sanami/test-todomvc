class Todomvc.Models.Todo extends Backbone.Model
  paramRoot: 'todo'

  defaults:
    title: null
    completed: false

class Todomvc.Collections.TodosCollection extends Backbone.Collection
  model: Todomvc.Models.Todo
  url: '/todos'
