define ['sinon', 'public/javascripts/backbone/models/todo', 'public/javascripts/vendor/sinon/jasmine-sinon'], (Sinon, Todo, jsinon) ->

	describe 'check require is including files', ->
		it 'should include sinon', ->
		  expect(Sinon).toBeDefined()

		it 'should include Todo', ->
		  expect(Todo).toBeDefined()
	  
	
	describe 'testem model', ->

		describe 'when instantiated', ->

		  	beforeEach ->
			    @todo = new Todo({
			    	title: "Rake leaves"
		    	});
		  
		  	it 'should exhibit attributes', ->

	    		expect(@todo.get('title')).toEqual 'Rake leaves'

	    	it 'should set the priority to default', ->
	        	expect(@todo.get('priority')).toEqual 3


	        it 'should set the url to the collection URL', ->
	          collection = {
	          	url: '/collection'
	          };
	          @todo.collection = collection
	          expect(@todo.url()).toEqual '/collection'

	        describe 'url', ->
	          
	        	beforeEach ->
		          	collection = {
		          		url: '/collection'
		          	}
		          	@todo.collection = collection;

		        describe 'when no id is set', ->

		        	it 'should return the collection url', ->
		        		expect(@todo.url()).toEqual '/collection'
		          

		        describe 'when id is set', ->

		        	it 'should return the collection url and id', ->
		        		@todo.id = 1
		        		expect(@todo.url()).toEqual '/collection/1'

	

	

