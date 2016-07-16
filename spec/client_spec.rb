require('spec_helper')

describe(Client) do
#
#   describe('#initialize') do
#     it('instantiates an client object') do
#       client = Client.new({:name => 'Mark Twain'})
#       expect(client.class).to eq(Client)
#     end
#
#     it('instantiates a client with a name') do
#       client = Client.new({:name => 'Mark Twain'})
#       expect(client.name).to eq('Mark Twain')
#     end
#
#     it('instantiates a client with an id') do
#       client = Client.new({:id => 1, :name => 'Michael Creighton'})
#       expect(client.id).not_to eq(nil)
#     end
#   end
#
#   describe('#save') do
#     it('creates/stores client objects on the database') do
#       client = Client.new({:id => nil, :name => 'Dr. Seuss'})
#       client.save()
#       result = DB.exec("SELECT name FROM clients WHERE name = 'Dr. Seuss';")
#       expect(result.getvalue(0,0)).to eq('Dr. Seuss')
#     end
#   end
#
#   describe('.delete_all') do
#     it('deletes stored client objects on the database') do
#       client1 = Client.new({:id => nil, :name => 'Italo Calvino'})
#       client1.save()
#       client2 = Client.new({:id => nil, :name => 'Tom Clancy'})
#       client2.save()
#       Client.delete_all
#       result = DB.exec("SELECT * FROM clients;")
#       expect(result.values.size()).to eq(0)
#     end
#   end
#
#   describe('#delete') do
#     it('deletes a client from the database') do
#       client = Client.new({:id => nil, :name => 'Tom Clancy'})
#       client.save()
#       client.delete
#       result = DB.exec("SELECT id FROM clients WHERE id = #{client.id};")
#       expect(result.values.size()).to eq(0)
#     end
#   end
#
#   describe('.all') do
#
#     it('returns all clients') do
#       client1 = Client.new({:id => nil, :name => 'Tom'})
#       client2 = Client.new({:id => nil, :name => 'Dick'})
#       client3 = Client.new({:id => nil, :name => 'Harry'})
#       client1.save()
#       client2.save()
#       client3.save()
#       expect(Client.all().size).to eq(3)
#     end
#   end
#
#   describe('.find') do
#
#     it('returns the client with the input id') do
#       client1 = Client.new({:id => nil, :name => 'Red'})
#       client2 = Client.new({:id => nil, :name => 'Green'})
#       client1.save()
#       client2.save()
#       expect(Client.find(client2.id)).to eq(client2)
#     end
#   end
#
#   describe('#==') do
#
#     it('returns true if the client objects @id and @title are equal') do
#       client1 = Client.new({:id => nil, :name => 'Red'})
#       client1.save()
#       client2 = Client.find(client1.id)
#       expect(client1).to eq(Client.find(client2.id))
#     end
#
#     it('returns false if the objects @id and @name are not equal') do
#       client1 = Client.new({:id => nil, :name => 'Red'})
#       client1.save()
#       client2 = Client.find(client1.id)
#       client3 = Client.new({:id => nil, :name => 'Red'})
#       client3.save
#       expect(client1).not_to eq(Client.find(client3.id))
#     end
#   end
#
#   describe('#update_name') do
#     it('will change the name of the client') do
#       client1 = Client.new({:id => nil, :name => 'Red'})
#       client1.save()
#       client1.update_name!('Green')
#       client2 = Client.find(client1.id)
#       expect(client2.name).to eq('Green')
#     end
#   end
end
