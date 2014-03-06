require 'rubygems'
require 'sinatra'
require 'haml'
require 'mongo'
require 'json'

DB = Mongo::Connection.new.db("sintra_development", :pool_size => 5, :timeout => 5)
notes = DB.collection('notes')

get '/' do 
	haml :index
end

get '/about' do 
	haml :about
end
	
get '/documents' do 
	halt "who goes there!?"
end