describe "Todo", ->
  subject = null

  beforeEach ->
    subject = new Todomvc.Models.Todo()

  it "should create subject", ->
    pp subject
    expect(subject).toNotEqual(null)

describe "TodosCollection", ->
  subject = null

  beforeEach ->
    subject = new Todomvc.Collections.TodosCollection()

  it "should create subject", ->
    pp subject
    expect(subject).toNotEqual(null)

  describe "parse_server_data", ->
    it "should add new models", ->
      json =
        todos: [
          {id: 1}
          {id: 2}
        ]
        since: '2013-04-17T15:00:00Z'

      subject.parse_server_data(json)
      expect(subject.get(1)).toNotEqual(null)
      expect(subject.get(2)).toNotEqual(null)
      expect(subject.get(3)).toEqual(null)
      pp subject

    it "should remove deleted models", ->
      subject.reset [
       {id: 1}
       {id: 2}
       {id: 3}
      ]

      json =
        todos: [
          {id: 1, deleted_at: null}
          {id: 2, deleted_at: true}
          {id: 3, deleted_at: null}
        ]
        since: '2013-04-17T15:00:00Z'

      subject.parse_server_data(json)
      expect(subject.get(1)).toNotEqual(null)
      expect(subject.get(2)).toEqual(null)
      expect(subject.get(3)).toNotEqual(null)
      pp subject

    it "should update changed models", ->
      subject.reset [
       {id: 1, completed: false}
       {id: 2, completed: false}
      ]

      json =
        todos: [
          {id: 1, completed: true}
          {id: 2, completed: false}
          {id: 3, deleted_at: null}
        ]
        since: '2013-04-17T15:00:00Z'

      subject.parse_server_data(json)
      expect(subject.get(1).get('completed')).toEqual(true)
      expect(subject.get(2).get('completed')).toEqual(false)
      expect(subject.get(3).get('completed')).toEqual(false)
      pp subject

  it "should handle on_add_model", ->
    time_str = "2013-04-17T15:00:00Z"
    subject.since = null
    model = new Todomvc.Models.Todo(updated_at: time_str)
    subject.on_add_model(model)
    expect(subject.since).toEqual(new Date(time_str))

  it "should handle on_reset_collection", ->
    time_str = "2013-04-17T15:00:00Z"
    time_str2 = "2013-04-17T15:00:10Z"
    time_str3 = "2013-04-17T15:00:05Z"

    subject.reset [
     {updated_at: time_str}
     {updated_at: time_str2}
     {updated_at: time_str3}
    ]

    subject.since = null
    subject.on_reset_collection()
    expect(subject.since).toEqual(new Date(time_str2))
