require('spec_helper')

describe(Client) do

  describe('#initialize') do
    it('instantiates an client object') do
      client = Client.new({:name => 'Mark Twain'})
      expect(client.class).to eq(Client)
    end

    it('instantiates a client with a name') do
      client = Client.new({:name => 'Mark Twain'})
      expect(client.name).to eq('Mark Twain')
    end

    it('instantiates a client with an id') do
      client = Client.new({:id => 1, :name => 'Joe'})
      expect(client.id).not_to eq(nil)
    end

    it('instantiates a client with a phone') do
      client = Client.new({:name => 'Mark Twain', :phone => '503-222-3333'})
      expect(client.phone).to eq('503-222-3333')
    end

    it('instantiates a client with an location') do
      client = Client.new({:id => 1, :name => 'Michael Creighton', :location => 'San Diego'})
      expect(client.location).to eq('San Diego')
    end
  end

  describe('#save') do
    it('creates/stores client objects on the database') do
      client = Client.new({:id => nil, :name => 'Dr. Seuss', :phone => '503-555-4444', :location => 'Sellwood'})
      returned_id = client.save()
      result = DB.exec("SELECT * FROM clients WHERE id = #{returned_id};")
    end
  end

  describe('.all') do

    it('returns all clients') do
      client1 = Client.new({:id => nil, :name => 'Dr. Seuss', :phone => '503-555-4444', :location => 'Sellwood'})
      client2 = Client.new({:id => nil, :name => 'Janet Jones', :phone => '503-555-4444'})
      client3 = Client.new({:id => nil, :name => 'Italo Calvino', :location => 'Roma'})
      client1.save()
      client2.save()
      client3.save()
      expect(Client.all()).to eq([client1, client2, client3])
    end
  end

  describe('#==') do

    it("returns true if the clients' @id/@name/@phone/@location/@stylist_id are equal") do
      client1 = Client.new({:id => nil, :name => 'Dr. Seuss', :phone => '503-555-4444', :location => 'Sellwood'})
      client1.save()
      expect(client1).to eq(Client.find(client1.id))
    end

    it("returns false if the clients' @id's aren't equal") do
      client1 = Client.new({:id => nil, :name => 'Dr. Seuss', :phone => '503-555-4444', :location => 'Sellwood'})
      client2 = Client.new({:id => nil, :name => 'Dr. Seuss', :phone => '503-555-4444', :location => 'Sellwood'})
      client1.save()
      client2.save()
      expect(client1).not_to eq(client2)
    end

    it('returns true if @id, @name, & @phone equal and @location is not set') do
      client1 = Client.new({:id => nil, :name => 'Jack Johsnon', :phone => '503-333-4444'})
      client1.save()
      client2 = Client.find(client1.id)
      expect(client1).to eq(Client.find(client2.id))
    end

    it('returns true if @id, @name, & @location equal and @phone is not set') do
      client1 = Client.new({:id => nil, :name => 'Jack Johsnon', :location => 'Beavertonia'})
      client1.save()
      client2 = Client.find(client1.id)
      expect(client1).to eq(Client.find(client2.id))
    end
  end

  describe('.find') do

    it('returns the client with the input id') do
      client1 = Client.new({:id => nil, :name => 'Dr. Seuss', :phone => '503-555-4444', :location => 'Sellwood'})
      client1.save()
      expect(Client.find(client1.id)).to eq(client1)
    end
  end

  describe('.delete_all') do
    it('deletes stored client objects on the database') do
      client1 = Client.new({:id => nil, :name => 'Italo Calvino'})
      client1.save()
      client2 = Client.new({:id => nil, :name => 'Tom Clancy'})
      client2.save()
      Client.delete_all
      result = DB.exec("SELECT * FROM clients;")
      expect(result.values.size()).to eq(0)
    end
  end

  describe('#delete') do
    it('deletes a client from the database') do
      client = Client.new({:id => nil, :name => 'Tom Clancy'})
      client.save()
      client_count_pre_delete = Client.all.size
      client.delete
      client_count_post_delete = Client.all.size
      expect(client_count_pre_delete).to eq(1)
      expect(client_count_post_delete).to eq(0)
    end
  end
#
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
