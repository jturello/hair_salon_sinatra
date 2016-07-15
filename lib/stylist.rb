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
    @location = args[:location]
    @phone = args[:phone]

  end


  def update!(args)
    @name = args[:name]

    return self

  end
#
#   define_method(:save) do
#     result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
#     @id = result.getvalue(0,0).to_i
#   end
#
#   define_singleton_method(:delete_all) do
#     DB.exec("DELETE FROM clients_stylists;")
#     DB.exec("DELETE FROM stylists;")
#   end
#
#   define_method(:delete) do
#     DB.exec("DELETE FROM clients_stylists WHERE stylist_id = #{@id};")
#     DB.exec("DELETE FROM stylists WHERE id = #{@id};")
#   end
#
#   def self.all
#     returned_stylists = DB.exec("SELECT * FROM stylists;")
#     stylists = []
#     returned_stylists.each do |stylist|
#       stylists.push(Book.new({:id => stylist['id'], :name => stylist['name']}))
#     end
#     stylists
#   end
#
#   def self.find(id)
#     stylist = DB.exec("SELECT * FROM stylists WHERE id = #{id}").first()
#     stylist_obj = Book.new({id: stylist['id'].to_i, name: stylist['name']})
#
#   end
#
#   def ==(other)
#     (@id == other.id) && (@name == other.name)
#   end
#
#   def add_clients(args)
#      client = args[:client]
#      DB.exec("INSERT INTO clients_stylists (client_id, stylist_id) VALUES  (#{client.id}, #{self.id});")
#    end
#
#    def clients()
#      clients = []
#      results = DB.exec("SELECT client_id FROM clients_stylists WHERE stylist_id = #{self.id};")
#      results.each() do |result|
#        client_id = result.fetch("client_id").to_i
#        client = DB.exec("SELECT name FROM clients WHERE id = #{client_id};")
#        name = client.first().fetch("name")
#        clients.push(Author.new({:id => client_id, :name => name}))
#      end
#      clients
#    end
end
