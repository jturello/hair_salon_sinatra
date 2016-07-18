require('pry')
class Stylist
#
  attr_reader :name, :id, :location, :phone
#
  def initialize(args)

    raise ArgumentError.new('Name cannot be nil!') if args[:name] == nil
    raise ArgumentError.new('Name cannot be an empty string!') if args[:name] == ''

    @id = args[:id]
    @name = args[:name]
    # if args for :phone or :location not supplied, set to ""
    args[:phone] == nil ? @phone = "" : @phone = args[:phone]
    args[:location] == nil ? @location = "" : @location = args[:location]

  end

  def update!(args)
    @name = args[:name] unless args[:name].nil? || args[:name] == ""
    args[:phone] == nil ? @phone = "" : @phone = args[:phone]
    args[:location] == nil ? @location = "" : @location = args[:location]
    return self
  end

  def save()
    result = DB.exec("INSERT INTO stylists (name, phone, location) VALUES ('#{@name}', '#{@phone}', '#{@location}') RETURNING id;")
    @id = result.getvalue(0,0).to_i
  end

  def self.all
    stylists = []
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    returned_stylists.each do |stylist|
      stylists.push(Stylist.new({:id => stylist['id'], :name => stylist['name'], :phone => stylist['phone'], :location => stylist['location']}))
    end
    stylists
  end

  def self.delete_all()
    DB.exec("DELETE FROM clients;")
    DB.exec("DELETE FROM stylists;")
  end

  def delete()
    DB.exec("DELETE FROM clients WHERE stylist_id = #{@id};")
    DB.exec("DELETE FROM stylists WHERE id = #{@id};")
  end

  def self.find(id)
    result = DB.exec("SELECT * FROM stylists WHERE id = #{id}") #.first()
# binding.pry
    if result.values.size() > 1 then raise ArgumentError "invalid SELECT result - dup stylist.id keys" end
    stylist = Stylist.new({:id => result[0]['id'].to_i, :name => result[0]['name'], :phone => result[0]['phone'], :location => result[0]['location']})
  end

  def ==(other)
    (@id == other.id) && (@name == other.name) && (@phone == other.phone) && (@location == other.location)
  end

  def add_client(args)
    client = args[:client]
    DB.exec("UPDATE clients SET stylist_id = #{@id} WHERE id = #{client.id};")
  end

 def clients()
    clients = []
    results = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id};")
    results.each() do |result|
      clients.push(Client.new({:id => result['id'].to_i, :name => result['name'], :phone => result['phone'], :location => result['location'], :stylist_id => result['stylist_id']}))
    end
    clients
  end
end
