class Client
    attr_reader(:name, :id)

    define_method(:initialize) do |attributes|
      @name = attributes.fetch(:name)
      @id = attributes.fetch(:id)
    end

    define_singleton_method(:all) do
      returned_clients = DB.exec("SELECT * FROM clients;")
      clients = []
      returned_clients.each() do |client|
        name = client.fetch("name")
        id = client.fetch("id").to_i()
        clients.push(Client.new({:name => name, :id => id}))
      end
      clients
    end

    define_method(:save) do
      result = DB.exec("INSERT INTO clients (name) VALUES ('#{@name}') RETURNING id;")
      @id = result.first().fetch("id").to_i()
    end

    define_method(:==) do | another_client |
      self.name().==(another_client.name()).&(self.id().==(another_client.id()))
    end

    define_singleton_method(:find) do |id|
      found_client = nil
      Client.all().each() do |client|
        if client.id().==(id)
          found_client = list
        end
      end
      found_client
    end

    # define_method(:clients) do
    #   client_clients = []
    #   clients = DB.exec("SELECT * FROM clients WHERE client_id = #{self.id()}")
    #   clients.each() do |client|
    #     name = client.fetch("name")
    #     client_id = client.fetch("client_id").to_i
    #     client_clients.push(Client.new({:name => name, :client_id => client_id}))
    #   end
    #   client_clients
    # end

  #update client
    define_method(:update) do |attributes|
      @name = attributes.fetch(:name)
      @id = self.id()
      DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@id};")
    end

  #delete client
    define_method(:delete) do
      DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
    #   DB.exec("DELETE FROM clients WHERE client_id = #{self.id()};")
    end

  # #delete entire table
  #   define_singleton_method(:clear) do
  #     DB.exec("TRUNCATE TABLE clients")
  #   end
end
