require("spec_helper")

describe(Stylist) do
  describe(".all") do
    it("starts off with no stylists") do
      expect(Stylist.all()).to(eq([]))
    end
  end


  describe("#name") do
    it("tells you the name") do
      stylist = Stylist.new({:name => "Quin", :id => nil})
      expect(stylist.name()).to(eq("Quin"))
    end
  end

  describe("#id") do
    it("sets the ID when you save it") do
      stylist = Stylist.new({:name => "Quin", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save stylists to the database") do
      stylist = Stylist.new({:name => "Quin", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same name") do
      stylist1 = Stylist.new({:name => "Quin", :id => nil})
      stylist2 = Stylist.new({:name => "Quin", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe(".find") do
    it("returns a list by its ID") do
      test_stylist = Stylist.new({:name => "Quin", :id => nil})
      test_stylist.save()
      test_stylist = Stylist.new({:name => "Quin", :id => nil})
      test_stylist.save()
    end
  end

  # describe("#clients") do
  #   it("returns an array of clients for that sylist") do
  #     test_stylist = Stylist.new({:name => "Quin", :id => nil})
  #     test_stylist.save()
  #     test_client = Client.new({:name => "Jackson", :id => nil})
  #     test_client.save()
  #     test_client2 = Client.new({:name => "Garrett", :id => nil})
  #     test_client2.save()
  #     expect(test_stylist.clients()).to(eq([test_client, test_client2]))
  #   end
  # end

#update a stylist
  describe("#update") do
    it("lets you update stylists in the database") do
      test_stylist = Stylist.new({:name => "Quin", :id => nil})
      test_stylist.save()
      test_stylist.update({:name => 'Lillian'})
      expect(test_stylist.name()).to(eq("Lillian"))
    end
  end

#delete a stylist
  describe("#delete") do
    it("lets you delete a stylist from the database") do
      test_stylist = Stylist.new({:name => "Quin", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "Jackson", :id => nil})
      test_stylist2.save()
      test_stylist.delete()
      expect(Stylist.all()).to(eq([test_stylist2]))
    end
    # it("deletes a stylist's clients from the database")do
    #   test_stylist = Stylist.new({:name => "Quin", :id => nil})
    #   test_stylist.save()
    #   test_client = Client.new({:name => "Jackson", :id => nil})
    #   test_client.save()
    #   test_stylist.delete()
    #   expect(Stylist.all()).to(eq([]))
    # end
  end
end
