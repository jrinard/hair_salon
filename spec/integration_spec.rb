require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('View Stylist Page', {:type => :feature}) do
  it('allows a user to click a link to see the stylists') do
    visit('/')
    click_link('View All Stylists')
    expect(page).to have_content('Add a Stylist')
  end
end

describe('adding a new stylist', {:type => :feature}) do
  it('allows a user to click a list to see the tasks and details for it') do
    visit('/stylists')
    fill_in('name', :with =>'Jon')
    click_button('Add Stylist')
    expect(page).to have_content('Here are your Stylists')
  end
end

describe('seeing details for a single stylist', {:type => :feature}) do
  it('allows a user to click a list to see the tasks and details for it') do
    test_stylist = Stylist.new({:id => 1, :name => 'Jon'})
    test_stylist.save()
    visit('/stylists')
    click_link(test_stylist.name())
    expect(page).to have_content("Jon")
  end
end

describe('adding clients to a Stylist', {:type => :feature}) do
  it('allows a user to add a client to a stylist') do
    test_stylist = Stylist.new({:id => 1, :name => 'Jon'})
    test_stylist.save()
    visit("/stylists/#{test_stylist.id()}")
    fill_in("name", {:with => "Matt"})
    click_button("Add Client")
    expect(page).to have_content("Matt")
  end
end

describe('edit stylist', {:type => :feature}) do
  it('allows a user to edit stylist') do
    test_stylist = Stylist.new({:id => 1, :name => 'Jon'})
    test_stylist.save()
    visit("/stylists/#{test_stylist.id()}")
    click_link("Edit")
    expect(page).to have_content("Jon")
  end
end

describe('edit client', {:type => :feature}) do
  it('allows a user to edit a client') do
    test_stylist = Stylist.new({:id => 1, :name => 'Jon'})
    test_stylist.save()
    test_client = Client.new({:id => 1, :name => 'Sue'})
    test_client.save()
    test_client.update({:stylist_id => test_stylist.id})
  end
end
