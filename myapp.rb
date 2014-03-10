require 'rubygems'
require 'sinatra'
require 'haml'
require 'mongo'
require 'json/ext'


include Mongo

configure do
  conn = MongoClient.new("localhost", 27017)
  set :mongo_connection, conn
  set :mongo_db, conn.db('tasks')
end

get '/collections/?' do
  settings.mongo_db.collection_names
end

helpers do
  def object_id val
    BSON::ObjectId.from_string(val)
  end

  def task_by_id id
    id = object_id(id) if String === id
    settings.mongo_db['tasks'].
      find_one(:_id => id).to_json
  end

end

get '/' do 
	haml :index
end

post '/tasks/?' do
	content_type :json
  data = JSON.parse(request.body.read)
  new_id = settings.mongo_db['tasks'].insert( { name: data['name'], importance: data['importance'], comments: [{comment: data['comment'], created_at: Time.now.strftime("%d/%m/%Y %H:%M"), by: 'John Doe'}] } )
  task_by_id(new_id).to_json
end

get '/tasks/?' do
  content_type :json
  settings.mongo_db['tasks'].find.to_a.to_json
end

get '/tasks/:id/?' do
  content_type :json
  task_by_id(params[:id]).to_json
end

get '/clear' do 
	settings.mongo_db['tasks'].remove()
end