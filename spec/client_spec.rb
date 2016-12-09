require("spec_helper")

describe(Client) do
  describe(".all") do
    it("starts off with no clients") do
      expect(Client.all()).to(eq([]))
    end
  end


  describe("#name") do
    it("tells you the name") do
      client = Client.new({:name => "Quin", :id => nil})
      expect(client.name()).to(eq("Quin"))
    end
  end

  describe("#id") do
    it("sets the ID when you save it") do
      client = Client.new({:name => "Quin", :id => nil})
      client.save()
      expect(client.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save clients to the database") do
      client = Client.new({:name => "Quin", :id => nil})
      client.save()
      expect(Client.all()).to(eq([client]))
    end
  end

  describe("#==") do
    it("is the same client if it has the same name") do
      client1 = Client.new({:name => "Quin", :id => nil})
      client2 = Client.new({:name => "Quin", :id => nil})
      expect(client1).to(eq(client2))
    end
  end

  describe(".find") do
    it("returns a list by its ID") do
      test_client = Client.new({:name => "Quin", :id => nil})
      test_client.save()
      test_client = Client.new({:name => "Quin", :id => nil})
      test_client.save()
    end
  end


# Had old clients???

#update a client
  describe("#update") do
    it("lets you update clients in the database") do
      test_client = Client.new({:name => "Quin", :id => nil})
      test_client.save()
      test_client.update({:name => 'Lillian'})
      expect(test_client.name()).to(eq("Lillian"))
    end
  end

#delete a client
  describe("#delete") do
    it("lets you delete a client from the database") do
      test_client = Client.new({:name => "Quin", :id => nil})
      test_client.save()
      test_client2 = Client.new({:name => "Jackson", :id => nil})
      test_client2.save()
      test_client.delete()
      expect(Client.all()).to(eq([test_client2]))
    end

# Had extra delete spec???

  end


end
