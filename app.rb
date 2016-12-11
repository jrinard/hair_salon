require('sinatra')
require('sinatra/reloader')
require('./lib/stylist')
require('./lib/client')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "hair_salon_test"})

get("/") do
  erb(:index)
end

#saves stylist form data
post('/stylists') do
  name = params.fetch("name")
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  @stylists = Stylist.all()
  erb(:stylists)
end

#view stylists
get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

get("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @client = Client.find(params.fetch("id").to_i())
  erb(:stylist)
end

#goes to edit page
get("/stylists/:id/edit") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist_edit)
end

#patch to update stylist
patch("/stylists/:id") do
  name = params.fetch("name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name})
  erb(:stylist)
end

#Delete stylist
delete("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:stylists)
end

#saves client to database
post("/clients") do
  name = params.fetch("name")
  stylist_id = params.fetch("stylist_id").to_i()
  @stylist = Stylist.find(stylist_id)
  @client = Client.new({ :id => nil, :name => name, :stylist_id => stylist_id})
  @client.save()
  erb(:stylist)
end


#edit client info. Note the different ids
get("/stylists/:stylist_id/clients/:id") do
  @client = Client.find(params.fetch("id").to_i())
  @stylist = Stylist.find(params.fetch("stylist_id").to_i())
  erb(:client_info)
end

#update clients
patch("/stylists/:sid/clients/:id") do
  name = params.fetch("name")
  @stylists = Stylist.all()
  @stylist = Stylist.find(params.fetch("sid").to_i())
  @client = Client.find(params.fetch("id").to_i())
  @client.update({:name => name})
  redirect "/stylists/#{params.fetch('sid')}"
end

#delete client
delete("/stylists/:id/clients/:id") do
  @client = Client.find(params.fetch("id").to_i())
  @client.delete()
  redirect "/"
end
