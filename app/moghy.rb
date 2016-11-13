require "sinatra"
require "sinatra/activerecord"

set :database, "sqlite3:moghy.sqlite3"

get "/" do
  erb :index
end
