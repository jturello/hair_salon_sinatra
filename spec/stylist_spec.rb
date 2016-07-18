require('spec_helper')

describe(Stylist) do

  describe('#initialize') do

    it('instantiates a stylist object') do
      stylist = Stylist.new({:id => nil, :name => 'Joan of Arch'})
      expect(stylist.class).to eq(Stylist)
    end

    it('instantiates a stylist with a name') do
      stylist = Stylist.new({:id => nil, :name => 'Jane Doe'})
      expect(stylist.name).to eq('Jane Doe')
    end

    it('creates a stylist with a location') do
      stylist = Stylist.new({:id => nil, :name => 'Bugs Bunny', :location => 'Beaverton'})
      expect(stylist.location).to eq('Beaverton')
    end

    it('creates a stylist with a phone number') do
      stylist = Stylist.new({:id => nil, :name => 'Bugs Bunny', :location => 'Beaverton', :phone => '503-111-2222'})
      expect(stylist.phone).to eq('503-111-2222')
    end

    context('throws an error') do
      it('when name is nil') do
        expect{Stylist.new({:id => nil, :name => nil})}.to raise_error(ArgumentError)
      end

      it('when name is empty string') do
        expect{Stylist.new({:id => nil, :name => ''})}.to raise_error(ArgumentError)
      end
    end
  end


  describe('#update!') do

    it("won't change @id") do
      stylist = Stylist.new({:id => nil, :name => 'Jane Doe'})
      stylist.save
      expect(stylist.update!({:id => 4}).id).to eq(stylist.id)
    end

    it('updates @name to another valid name') do
      stylist = Stylist.new({:id => nil, :name => 'Jane Doe'})
      stylist.save
      stylist.update!({:name => "Jack Flack"})
      expect(stylist.name).to eq('Jack Flack')
    end

    it("won't change @name to nil") do
      stylist = Stylist.new({:id => nil, :name => 'Jane Doe'})
      stylist.save
      expect(stylist.update!({:name => nil}).name).to eq('Jane Doe')
    end

    it("won't set @name to empty string") do
      stylist = Stylist.new({:id => nil, :name => 'Jane Doe'})
      stylist.save
      expect(stylist.update!({:name => ''}).name).to eq('Jane Doe')
    end

    it('updates @phone to another valid phone number') do
      stylist = Stylist.new({:id => nil, :name => 'Jane Doe', :phone => '503-111-2222'})
      stylist.save
      expect(stylist.update!({:phone => '512-555-5555'}).phone).to eq('512-555-5555')
    end

    it('wont allow @phone to be nil') do
      stylist = Stylist.new({:id => nil, :name => 'Jane Doe', :phone => '503-111-2222'})
      stylist.save
      expect(stylist.update!({:phone => nil}).phone).not_to eq(nil)
    end

    it('allows @phone to be empty string') do
      stylist = Stylist.new({:id => nil, :name => 'Jane Doe', :phone => '503-111-2222'})
      stylist.save
      expect(stylist.update!({:phone => ''}).phone).to eq('')
    end

    it('updates @location to another valid location') do
      stylist = Stylist.new({:id => nil, :name => 'Jane Doe', :location => 'Beaverton'})
      stylist.save
      expect(stylist.update!({:location => 'Hillsboro'}).location).to eq('Hillsboro')
    end

    it('wont allow @location to be nil') do
      stylist = Stylist.new({:id => nil, :name => 'Jane Doe', :location => 'Beaverton'})
      stylist.save
      expect(stylist.update!({:location => nil}).location).not_to eq(nil)
    end

    it('allows @location to be empty string') do
      stylist = Stylist.new({:id => nil, :name => 'Jane Doe', :location => 'Beaverton'})
      stylist.save
      expect(stylist.update!({:location => ''}).location).to eq('')
    end

    it('updates stylist record on database as well as object') do
      stylist = Stylist.new({:id => nil, :name => 'Joe Montana', :phone => '503-333-4444', :location => 'Beavertonia'})
      stylist.save
      stylist.update!({:name => "Judy Tenuta", :location => "Phoenix"})
      result = DB.exec("SELECT * FROM stylists WHERE id = #{stylist.id};")
      expect((result[0]['id'] == stylist.id) && (result[0]['name'] == "Judy Tenuta"))
      expect((stylist.name == "Judy Tenuta") && (stylist.location == "Phoenix"))
      expect(Stylist.find(stylist.id)).to eq(stylist)
    end
  end

  describe('#save') do
    it('inserts stylist into the database') do
      stylist = Stylist.new({:id => nil, :name => 'Elmer Fudd'})
      stylist.save()
      result = DB.exec("SELECT name FROM stylists WHERE name = 'Elmer Fudd';")
      expect(result.getvalue(0,0)).to eq('Elmer Fudd')
    end
  end

  describe('.all') do
    it('returns all stylists') do
      stylist1 = Stylist.new({:id => nil, :name => 'Jenny'})
      stylist2 = Stylist.new({:id => nil, :name => 'Glenda'})
      stylist1.save()
      stylist2.save()
      expect(Stylist.all().size).to eq(2)
    end
  end

  describe('.delete_all') do
    it('deletes stylists from the database') do
      stylist1 = Stylist.new({:id => nil, :name => 'Glenda', :location => 'Bend'})
      stylist2 = Stylist.new({:id => nil, :name => 'Glenda', :location => 'Bend'})
      stylist1.save()
      stylist2.save()
      Stylist.delete_all
      result = DB.exec("SELECT * FROM stylists;")
      expect(result.values.size()).to eq(0)
    end
  end

  describe('#delete') do

    it('deletes a stylist from the database') do
      stylist = Stylist.new({:id => nil, :name => 'Jack Green'})
      stylist.save()
      client = Client.new({:id => nil, :name => "Joe", :stylist_id => stylist.id})
      client.save
      result1 = DB.exec("SELECT name FROM stylists WHERE id = #{stylist.id};")
      stylist.delete
      result2 = DB.exec("SELECT name FROM stylists WHERE id = #{stylist.id};")
      expect(result1.values).to eq([["Jack Green"]])
      expect(result2.values).to eq([])
    end
  end

  describe('.find') do
    it('returns the stylist with the input id') do
      stylist1 = Stylist.new({:id => nil, :name => 'Joe Montana', :phone => '503-333-4444', :location => 'Beavertonia'})
      stylist2 = Stylist.new({:id => nil, :name => 'Brenda Lee Johnson', :phone => '234-123-4567', :location => 'Portland'})
      stylist1.save()
      stylist2.save()
      expect(Stylist.find(stylist2.id)).to eq(stylist2)
    end
  end

  describe('#==') do
    it('returns true if the @id, @name, @phone, and @location are equal') do
      stylist1 = Stylist.new({:id => nil, :name => 'Jack Johsnon', :phone => '503-333-4444', :location => 'Beavertonia'})
      stylist1.save()
      stylist2 = Stylist.find(stylist1.id)
      expect(stylist1).to eq(Stylist.find(stylist2.id))
    end

    it("returns false if the stylists' @id's aren't equal") do
      stylist1 = Stylist.new({:id => nil, :name => 'Dr. Seuss', :phone => '503-555-4444', :location => 'Sellwood'})
      stylist2 = Stylist.new({:id => nil, :name => 'Dr. Seuss', :phone => '503-555-4444', :location => 'Sellwood'})
      stylist1.save()
      stylist2.save()
      expect(stylist1).not_to eq(stylist2)
    end

    it('returns true if @id, @name, & @phone equal and @location is not set')do
      stylist1 = Stylist.new({:id => nil, :name => 'Jack Johsnon', :phone => '503-333-4444'})
      stylist1.save()
      stylist2 = Stylist.find(stylist1.id)
      expect(stylist1).to eq(Stylist.find(stylist2.id))
    end

    it('returns true if @id, @name, & @location equal and @phone is not set')do
      stylist1 = Stylist.new({:id => nil, :name => 'Jack Johsnon', :location => 'Beavertonia'})
      stylist1.save()
      stylist2 = Stylist.find(stylist1.id)
      expect(stylist1).to eq(Stylist.find(stylist2.id))
    end
  end

  describe('#add_client') do
    it("let's user associate clients with stylists") do
      stylist = Stylist.new({:id => nil, :name => "Brenda Lee Johnson"})
      stylist.save()
      client_dude = Client.new({:id => nil, :name => 'Lenard Ripchen'})
      client_dude.save()
      stylist.add_client({:client => client_dude})
      expect(stylist.clients()).to eq([client_dude])
    end

    it("let's user associate multiple clients with a stylist") do
      stylist = Stylist.new({:id => nil, :name => "Brenda Lee Johnson", :phone => '503-543-6543', :location => 'Seattle'})
      stylist.save()
      client1 = Client.new({:id => nil, :name => 'Lenard Nemoy', :phone => '111-222-3333', :location => 'Honolulu'})
      client1.save()
      stylist.add_client({:client => client1})
      client2 = Client.new({:id => nil, :name => 'Minny Mouse', :phone => '111-222-9876', :location => 'Disneyland'})
      client2.save()
      stylist.add_client({:client => client2})
      expect(stylist.clients()).to eq([client1, client2])
    end
  end

  describe('#remove_client') do
    #pending
  end
end
