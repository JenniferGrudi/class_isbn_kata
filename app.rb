require 'sinatra'
require_relative "class_isbn_kata.rb"
require 'pg'

db_params = {
	host: 'minedmindsisbn.cff8qqhpkday.us-west-2.rds.amazonaws.com',
	port: '5432',
	dbname: 'minedmindsisbn',
	user: 'minedminds',
	password: 'workflow3',
}	

db = PG::Connection.new(db_params)

get '/' do
	erb :isbn, :locals => {:validity => "" }
end	

post '/input' do
	select = db.exec("select ISBN, VALIDITY FROM ISBN;")
	validity = valid_isbn?(select[0]["isbn"])
	if validity == false
		erb :isbn, :locals => {:validity => "That is a Invalid Isbn Number"}
	else 
		erb :isbn, :locals => {:validity => "That is a Valid Isbn Number"}	
		# db.exec("UPDATE ISBN set (validity) = ('Valid') where isbn = '#{validity}';")
	end	
end
