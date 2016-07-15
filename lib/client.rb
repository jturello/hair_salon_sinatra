class Client
#
  attr_reader :name, :id, :stylist_id
#
  def initialize(args)
    @id = args[:id]
    @name = args[:name]
    @phone = args[:phone]
    @location = args[:location]
    @stylist_id = args[:stylist_id]
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, phone, location, stylist_id) VALUES ('#{@name}', '#{@phone}', '#{@location}', '#{@stylist_id}') RETURNING id;")
    @id = result.getvalue(0,0).to_i
  end
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
#   def self.find(id)
#     client = DB.exec("SELECT * FROM clients WHERE id = #{id}").first()
#     return Client.new({id: client['id'].to_i, name: client['name']})
#   end
#
#   def ==(other)
#     (@id == other.id) && (@name == other.name)
#   end
#
#   def update_name!(new_name)
#     @name = new_name
#     DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@id}")
#   end
end
