require 'sinatra'
require 'sinatra/activerecord'

ActiveRecord::Base.establish_connection(
	:adapter => 'sqlite3',
	:database => 'dev.db'
	)

ActiveRecord::Base.default_timezone = :local

class List < ActiveRecord::Base
end

get "/" do
	@lists = List.all()
	@title = "List"
	erb :index
end

post "/" do
	@lists = List.new(params[:lists])
	@lists.save
	redirect '/'
end

