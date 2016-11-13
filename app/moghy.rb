require "sinatra"
require "sinatra/activerecord"
require "active_support"

require_relative "models/witness"

set :database, "sqlite3:moghy.sqlite3"
Time.zone = "UTC"

get "/" do
  @witness = Witness.order(:witnessed_at).last
  @drunk = @witness ? @witness.witnessed_at > 4.hours.ago : false

  erb :index
end

post "/witness" do
  Time.zone = "UTC"

  name = params[:name]
  name = nil if name == ""

  Witness.create!(name: name, witnessed_at: Time.zone.now)
  redirect to("/")
end
