class Client
#
  attr_reader :name, :id, :phone, :location, :stylist_id
#
  def initialize(args)
    @phone = ""
    @location = ""

    @id = args[:id]
    @name = args[:name]
    @phone ||= args[:phone]
    @location ||= args[:location]
    #stylist_id always set to nil here  to limit access as it's the foreign key in DB,
    #it is only set programmatically in styist#add_client
    @stylist_id = nil  #args[:stylist_id]
  end

  def save()
    result = DB.exec("INSERT INTO clients (name, phone, location) VALUES ('#{@name}', '#{@phone}', '#{@location}') RETURNING id;")
    @id = result.getvalue(0,0).to_i
  end
  # #
  #   def self.find(id)
  #     client = DB.exec("SELECT * FROM clients WHERE id = #{id}").first()
  #     return Client.new({id: client['id'].to_i, name: client['name']})
  #   end
#
#   define_singleton_method(:delete_all) do
#     DB.exec("DELETE FROM clients;")
#   end
#
#   define_method(:delete) do
#     DB.exec("DELETE FROM clients WHERE id = #{@id};")
#   end
#
#   def self.all
#     clients = []
#     returned_clients = DB.exec("SELECT * FROM clients;")
#     returned_clients.each do |client|
#       clients.push(Client.new({:id => client['id'], :name => client['name']}))
#     end
#     clients
#   end
#
  def ==(other)
    (@id == other.id) && (@name == other.name) && (@phone == other.phone) && (@location == other.location) && (@stylist_id == other.stylist_id)
  end
#
#   def update_name!(new_name)
#     @name = new_name
#     DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@id}")
#   end
end
