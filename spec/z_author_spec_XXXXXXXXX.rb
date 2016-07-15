# require('spec_helper')
#
# describe(Author) do
#
#   describe('#initialize') do
#     it('instantiates an author object') do
#       author = Author.new({:name => 'Mark Twain'})
#       expect(author.class).to eq(Author)
#     end
#
#     it('instantiates a author with a name') do
#       author = Author.new({:name => 'Mark Twain'})
#       expect(author.name).to eq('Mark Twain')
#     end
#
#     it('instantiates a author with an id') do
#       author = Author.new({:id => 1, :name => 'Michael Creighton'})
#       expect(author.id).not_to eq(nil)
#     end
#   end
#
#   describe('#save') do
#     it('creates/stores author objects on the database') do
#       author = Author.new({:id => nil, :name => 'Dr. Seuss'})
#       author.save()
#       result = DB.exec("SELECT name FROM authors WHERE name = 'Dr. Seuss';")
#       expect(result.getvalue(0,0)).to eq('Dr. Seuss')
#     end
#   end
#
#   describe('.delete_all') do
#     it('deletes stored author objects on the database') do
#       author1 = Author.new({:id => nil, :name => 'Italo Calvino'})
#       author1.save()
#       author2 = Author.new({:id => nil, :name => 'Tom Clancy'})
#       author2.save()
#       Author.delete_all
#       result = DB.exec("SELECT * FROM authors;")
#       expect(result.values.size()).to eq(0)
#     end
#   end
#
#   describe('#delete') do
#     it('deletes a author from the database') do
#       author = Author.new({:id => nil, :name => 'Tom Clancy'})
#       author.save()
#       author.delete
#       result = DB.exec("SELECT id FROM authors WHERE id = #{author.id};")
#       expect(result.values.size()).to eq(0)
#     end
#   end
#
#   describe('.all') do
#     it('returns all authors') do
#       author1 = Author.new({:id => nil, :name => 'Tom'})
#       author2 = Author.new({:id => nil, :name => 'Dick'})
#       author3 = Author.new({:id => nil, :name => 'Harry'})
#       author1.save()
#       author2.save()
#       author3.save()
#       expect(Author.all().size).to eq(3)
#     end
#   end
#
#   describe('.find') do
#     it('returns the author with the input id') do
#       author1 = Author.new({:id => nil, :name => 'Red'})
#       author2 = Author.new({:id => nil, :name => 'Green'})
#       author1.save()
#       author2.save()
#       expect(Author.find(author2.id)).to eq(author2)
#     end
#   end
#
#   describe('#==') do
#     it('returns true if the author objects @id and @title are equal') do
#       author1 = Author.new({:id => nil, :name => 'Red'})
#       author1.save()
#       author2 = Author.find(author1.id)
#       expect(author1).to eq(Author.find(author2.id))
#     end
#
#     it('returns false if the objects @id and @name are not equal') do
#       author1 = Author.new({:id => nil, :name => 'Red'})
#       author1.save()
#       author2 = Author.find(author1.id)
#       author3 = Author.new({:id => nil, :name => 'Red'})
#       author3.save
#       expect(author1).not_to eq(Author.find(author3.id))
#     end
#   end
#
#   describe('#update_name') do
#     it('will change the name of the author') do
#       author1 = Author.new({:id => nil, :name => 'Red'})
#       author1.save()
#       author1.update_name!('Green')
#       author2 = Author.find(author1.id)
#       expect(author2.name).to eq('Green')
#     end
#   end
# end
