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
  # erb(:index)
end

get('/stylists/:id') do
  @page_title = "Stylist Detail Page"
  @stylist = Stylist.find(params[:id].to_i)
# binding.pry
  erb(:stylist)
end

delete('/stylists/:id') do
  stylist = Stylist.find(params[:id].to_i)
  stylist.delete()
  redirect('/')
end


#
# get('/admin') do
#     @page_title = "Book Catalog"
#     erb(:books)
# end
#
# post('/add_book') do
#   title = params[:book]
#   book = Book.new({:id => nil, :title => title})
#   book.save()
#   erb(:books)
# end
#
# get ('/books/:id') do
#   @page_title = "Book Detail Page"
#   @book = Book.find(params[:id].to_i)
#   erb(:book)
# end
#
# post ('/add_author') do
#   @page_title = "Book Detail Page"
#   @ ~~~~~ author = Author.new({:id => nil, :name => params[:author]})
#   @author.save()
#   @book = Book.find(params[:book_id].to_i)
#   @book.add_authors({:author => @author})
#   @book.authors()
#   erb(:book)
# end
