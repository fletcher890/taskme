define ['backbone', 'sinon', 'public/javascripts/backbone/models/todo', 'public/javascripts/backbone/collections/todos', 'public/javascripts/vendor/sinon/jasmine-sinon'], (Backbone, Sinon, Todo, Todos, jsinon) ->

	describe "Todos collection", ->

		beforeEach ->
		    @model = new Backbone.Model(
		      id: 5
		      title: "Todo 2"
		      priority: 2
		    )

		    @todo1 = new Backbone.Model(id: 1, title: "Todo 1", priority: 3)
		    @todo2 = new Backbone.Model(id: 2, title: "Todo 2", priority: 2)
		    @todo3 = new Backbone.Model(id: 3, title: "Todo 3", priority: 1)

		    @todos = new Todos()
		    @todos.model = Todo
		    @todos.add({
		    	id: 5,
		    	title: "Foo"
	    	});
		    return

		afterEach ->
		
		it 'should add a model', ->
	    	expect(@todos.length).toEqual 1

	  	it 'should find a model by id', ->
	  		expect(@todos.get(5).get('id')).toEqual 5

	  	it 'should order models by prioirty', ->
	  		@todos.add([@todo1, @todo2, @todo3])
	  		expect(@todos.at(0)).toEqual @todo3
	  		expect(@todos.at(1)).toEqual @todo2
		

		describe "when fetching collection from server", ->
			beforeEach ->
			    @server = sinon.fakeServer.create()
			    @server.respondWith(
			    	"GET",
			    	"/todos",
			    	[200, {"Content-Type": "application/json"}, JSON.stringify([{ id: 1, text: "Provide examples", done: true }]) ]
			    )
			    return

			afterEach ->
			    @server.restore()
			    return
	  	  
	  		it 'should make the correct request', ->
		  	  	@todos.fetch()
		  	  	expect(@server.requests.length).toEqual 1
		  	  	expect(@server.requests[0].method).toEqual "GET"
		  	  	expect(@server.requests[0].url).toEqual "/todos"

		  	it 'should parse todos from the response', ->
		  	  @todos.fetch()
		  	  @server.respond();
		  	  expect(@todos.length).toEqual 1


