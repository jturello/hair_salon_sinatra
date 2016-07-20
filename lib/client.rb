class Client

  attr_reader :name, :id, :phone, :location, :stylist_id

  def initialize(args)

    @id = args[:id]
    @name = args[:name]
    # if args for :phone or :location not supplied, set to ""
    args[:phone] == nil ? @phone = "" : @phone = args[:phone]
    args[:location] == nil ? @location = "" : @location = args[:location]
    @stylist_id = args[:stylist_id]
  end

  def save()
    result = DB.exec("INSERT INTO clients (name, phone, location) VALUES ('#{@name}', '#{@phone}', '#{@location}') RETURNING id;")
    @id = result.getvalue(0,0).to_i
  end

  def self.all
    clients = []
    returned_clients = DB.exec("SELECT * FROM clients;")
    returned_clients.each do |client|
      clients.push(Client.new({:id => client['id'].to_i, :name => client['name'], :phone => client['phone'], :location => client['location'], :stylist_id => client['stylist_id']}))
    end
    clients
  end

  def self.find(id)
    client = DB.exec("SELECT * FROM clients WHERE id = #{id}").first()
    return Client.new({:id => client['id'].to_i, :name => client['name'], :phone => client['phone'], :location => client['location'], :stylist_id => client['stylist_id']})
  end

  def self.delete_all()
    DB.exec("DELETE FROM clients;")
  end

  def delete()
    DB.exec("DELETE FROM clients WHERE id = #{@id};")
  end

  def ==(other)
    (@id == other.id) && (@name == other.name) && (@phone == other.phone) && (@location == other.location) && (@stylist_id == other.stylist_id)
  end

  def update!(args)

    if (!(args[:name].nil?)) && (!((args[:name] == "")))
      @name = args[:name]  #unless args[:name].nil? || args[:name] == "" # || args[:name] == " "
      DB.exec("UPDATE Clients SET name = '#{@name}' WHERE id = #{@id}")
    end

    if (!(args[:phone].nil?))
      @phone = args[:phone]
      DB.exec("UPDATE Clients SET phone = '#{@phone}' WHERE id = #{@id}")
    end

    if (!(args[:location].nil?))
      @location = args[:location]
      DB.exec("UPDATE Clients SET location = '#{@location}' WHERE id = #{@id}")
    end

    return self
  end
end
