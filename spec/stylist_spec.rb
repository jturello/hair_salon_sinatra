require('spec_helper')

describe(Stylist) do

  describe('#initialize') do

    it('instantiates a stylist object') do
      stylist = Stylist.new({:id => 1, :name => 'Joan of Arch'})
      expect(stylist.class).to eq(Stylist)
    end


    it('instantiates a stylist with a name') do
      stylist = Stylist.new({:name => 'Jane Doe'})
      expect(stylist.name).to eq('Jane Doe')
    end

    it('throws an error when the name is nil') do
      expect{Stylist.new({:id => nil, :name => nil})}.to raise_error(ArgumentError)
    end

    it('throws an error when the name is empty string') do
      expect{Stylist.new({:id => nil, :name => ''})}.to raise_error(ArgumentError)
    end
  end
  #
  # describe('#save') do
  #   it('creates/stores stylist objects on the database') do
  #     stylist = Stylist.new({:id => nil, :name => 'Red'})
  #     stylist.save()
  #     result = DB.exec("SELECT name FROM stylists WHERE name = 'Red';")
  #     expect(result.getvalue(0,0)).to eq('Red')
  #   end
  # end
  #
  # describe('.delete_all') do
  #   it('deletes stored stylist objects on the database') do
  #     stylist = Stylist.new({:id => nil, :name => 'Blue'})
  #     stylist.save()
  #     Stylist.delete_all
  #     result = DB.exec("SELECT * FROM stylists;")
  #     expect(result.values.size()).to eq(0)
  #   end
  # end
  #
  # describe('#delete') do
  #   it('deletes a stylist from the database') do
  #     stylist = Stylist.new({:id => nil, :name => 'Green'})
  #     stylist.save()
  #     stylist.delete
  #     result = DB.exec("SELECT id FROM stylists WHERE id = #{stylist.id};")
  #     expect(result.values.size()).to eq(0)
  #   end
  # end
  #
  # describe('.all') do
  #   it('returns all stylists') do
  #     stylist1 = Stylist.new({:id => nil, :name => 'Red'})
  #     stylist2 = Stylist.new({:id => nil, :name => 'Green'})
  #     stylist3 = Stylist.new({:id => nil, :name => 'Yellow'})
  #     stylist1.save()
  #     stylist2.save()
  #     stylist3.save()
  #     expect(Stylist.all().size).to eq(3)
  #   end
  # end
  #
  # describe('.find') do
  #   it('returns the stylist with the input id') do
  #     stylist1 = Stylist.new({:id => nil, :name => 'Red'})
  #     stylist2 = Stylist.new({:id => nil, :name => 'Green'})
  #     stylist1.save()
  #     stylist2.save()
  #     expect(Stylist.find(stylist2.id)).to eq(stylist2)
  #   end
  # end
  #
  # describe('#==') do
  #   it('returns true if the objects @id and @name are equal') do
  #     stylist1 = Stylist.new({:id => nil, :name => 'Red'})
  #     stylist1.save()
  #     stylist2 = Stylist.find(stylist1.id)
  #     expect(stylist1).to eq(Stylist.find(stylist2.id))
  #   end
  #
  #   it('returns false if the objects @id and @name are not equal') do
  #     stylist1 = Stylist.new({:id => nil, :name => 'Red'})
  #     stylist1.save()
  #     stylist2 = Stylist.find(stylist1.id)
  #     stylist3 = Stylist.new({:id => nil, :name => 'Red'})
  #     stylist3.save
  #     expect(stylist1).not_to eq(Stylist.find(stylist3.id))
  #   end
  # end
  #
  # describe('#update_name') do
  #   it('will change the name of the stylist') do
  #     stylist1 = Stylist.new({:id => nil, :name => 'Red'})
  #     stylist1.save()
  #     stylist1.update_name!('Green')
  #     stylist2 = Stylist.find(stylist1.id)
  #     expect(stylist2.name).to eq('Green')
  #   end
  # end
  #
  # describe('#add_clients') do
  #   it("let's user associate clients with stylists") do
  #     stylist = Stylist.new({:id => nil, :name => "The Hobbit"})
  #     stylist.save()
  #     tolkien = Author.new({:id => nil, :name => 'J.R.R Tolkien'})
  #     tolkien.save()
  #     stylist.add_clients({:client => tolkien})
  #     expect(stylist.clients()).to eq([tolkien])
  #   end
  # end
end
