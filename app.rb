require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/stylist')
require('./lib/client')
require('pry')
require('launchy')
require('pg')


get('/') do
  @page_title = "The Rubyist Hair Salon"
  erb(:stylists)
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
