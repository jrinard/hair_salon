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





end
