require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/stylist')
require('./lib/client')
require('pry')
require('launchy')
require('pg')

DB = PG.connect({:dbname => 'hair_salon_test'})

get('/') do
  @page_title = "The Rubyist Hair Salon"
  @stylists = Stylist.all()
  erb(:index)
end

get('/stylist_form') do
  erb(:stylist_form)
end

post('/stylists/new') do
  @page_title = "The Rubyist Hair Salon"
  name = params[:name]
  phone = params[:phone]
  location = params[:location]
  @stylist = Stylist.new({:id => nil, :name => name, :phone => phone, :location => location})
  @stylist.save
  redirect ('/')
end

get('/stylists/:id') do
  @page_title = "Stylist Detail Page"
  @stylist = Stylist.find(params[:id].to_i)
  erb(:stylist)
end

patch('/stylists/:id') do
  @page_title = "Stylist Detail Page"
  @stylist = Stylist.find(params[:id].to_i)
  new_name = params[:new_name]
  new_phone = params[:new_phone]
  new_location = params[:new_location]
  @stylist.update!({name: new_name, phone: new_phone, location: new_location})

  redirect("/stylists/#{@stylist.id}")
  # erb(:stylist)
end

delete('/stylists/:id') do
  stylist = Stylist.find(params[:id].to_i)
  stylist.delete()
  redirect('/')
end

get('/stylists/:id/clients/new') do
  @page_title = "Add Client Page"
  @stylist = Stylist.find(params[:id].to_i)
  erb(:client_form)
end

post('/stylists/:id/clients/new') do
# binding.pry
  @stylist = Stylist.find(params['id'].to_i)
  client = Client.new({id: nil, name: params[:name], phone: params[:phone], location: params[:location]})
  client.save()
  @stylist.add_client({:client => client})
  # binding.pry

  # @stylist_clients = @stylist.clients()
  erb(:stylist)
end
