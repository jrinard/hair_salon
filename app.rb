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

#Saves stylist form data
post('/stylists') do
  name = params.fetch("name")
  # id = params.fetch("id").to_i()
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  @stylists = Stylist.all()
  erb(:stylists)
end

#View Stylists
get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

get("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @client = Client.find(params.fetch("id").to_i())
  erb(:stylist)
end

#Goes to Edit Page
get("/stylists/:id/edit") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist_edit)
end

#Patch to Update Stylist
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


#saves client to Database
post("/clients") do
  name = params.fetch("name")
  stylist_id = params.fetch("stylist_id").to_i()
  @stylist = Stylist.find(stylist_id)
  @client = Client.new({ :id => nil, :name => name, :stylist_id => stylist_id})       #added id
  @client.save()
  erb(:stylist)
end


#edit client info
get("/stylists/:id/clients/:id") do
  @client = Client.find(params.fetch("id").to_i())
  erb(:client_info)
end

#update Clients
patch("/stylists/:id/clients/:id") do
  name = params.fetch("name")
  @stylists = Stylist.all()
  @stylist = Stylist.find(params.fetch("id").to_i())
  @client = Client.find(params.fetch("id").to_i())
  @client.update({:name => name})
  erb(:client_info)
end


#delete client
delete("/stylists/:id/clients/:id") do
  @client = Client.find(params.fetch("id").to_i())
  @client.delete()
  @client = Client.new(:name => "empty")
  stylist_id = @client.stylist_id
  @stylists = Stylist.all
  @clients = Client.all
  erb(:index)
end
