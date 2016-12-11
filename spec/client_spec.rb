require("spec_helper")

describe(Client) do
  describe(".all") do
    it("starts off with no clients") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("lets you save clients to the database") do
      client = Client.new({:name => "Quin", :id => nil, :stylist_id => 1})
      client.save()
      expect(Client.all()).to(eq([client]))
    end
  end

  describe("#name") do
    it("lets you read the name") do
      client = Client.new({:name => "Quin", :id => nil, :stylist_id => 1})
      expect(client.name()).to(eq("Quin"))
    end
  end

  describe("#stylist_id") do
  it("lets you read the stylist ID out") do
    client = Client.new({:name => "Quin", :id => nil, :stylist_id => 1})
    expect(client.stylist_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same client if it has the same name") do
      client1 = Client.new({:name => "Quin", :id => nil, :stylist_id => 1})
      client2 = Client.new({:name => "Quin", :id => nil, :stylist_id => 1})
      expect(client1).to(eq(client2))
    end
  end

  #update a client
  describe("#update") do
    it("lets you update client in the database") do
      client = Client.new({:name => "Quin", :id => nil, :stylist_id => 1})
      client.save()
      client.update({:name => 'Lillian'})
      expect(client.name()).to(eq("Lillian"))
    end
  end

  #delete a client
  describe("#delete") do
    it("lets you delete a client from the database") do
      client = Stylist.new({:name => "Quin", :id => nil})
      client.save()
      client.delete()
      expect(Client.all()).to(eq([]))
    end
  end
end
