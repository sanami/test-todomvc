class Todomvc.Models.Todo extends Backbone.Model
  paramRoot: 'todo'

  defaults:
    title: null
    completed: false

class Todomvc.Collections.TodosCollection extends Backbone.Collection
  model: Todomvc.Models.Todo
  url: '/todos'

  initialize: ->
    @since = null
#    @on 'add change', @on_add_model
#    @on 'reset', @on_reset_collection

  # Process new models
  parse_server_data: (json)->
    @since = new Date(json['since']).toISOString()

    for attrs in json['todos']
      #pp attrs
      if attrs['deleted_at']
        # Delete from collection and skip
        model = @get(attrs['id'])
        if model
          @remove(model)
      else
        @add(attrs, merge: true)

  # Get 'since' from model time   NOT USED
  on_add_model: (model)->
    model_time = model.get('updated_at')
    if model_time
      model_time = new Date(model.get('updated_at'))

      if !@since || model_time > @since
        @since = model_time
        #pp 'on_add_model', @since

  # Get 'since' from newest models time   NOT USED
  on_reset_collection: (collection)->
    if @length > 0
      last_updated = @max (obj)->
        new Date(obj.get('updated_at'))

      @since = new Date(last_updated?.get('updated_at'))
    else
      @since = null
    #pp 'on_reset_collection', @since
