require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe("root path '/'", {:type => :feature}) do
  it('displays the homepage') do
    visit('/')
    expect(page).to have_content('The Rubyist Hair Salon')
  end
end
#
# describe('/stylists path - display all stylists') do
# end
#
# describe('/stylists path - display all stylists', {:type => :feature}) do
#   it('displays stylist catalog') do
#     visit('/')
#     click_link('Admin')
#     expect(page).to have_content('Stylist Catalog')
#   end
# end
#
# describe('/admin - adding a stylist', {:type => :feature}) do
#   it("lists all the stylist's authors") do
#     visit('/')
#     click_link('Admin')
#     fill_in('stylist', :with => 'The Hobbit')
#     click_button('Add')
#     expect(page).to have_content('The Hobbit')
#   end
# end
#
# describe('/stylist/:id - stylist detail page', {:type => :feature}) do
#   it("displays header - Stylist Detail Page") do
#     visit('/')
#     click_link('Admin')
#     fill_in('stylist', :with => 'The Hobbit')
#     click_button('Add')
#     click_link('The Hobbit')
#     expect(page).to have_content('Stylist Detail Page')
#   end
#
#   it("displays the author when added to a stylist") do
#     visit('/')
#     click_link('Admin')
#     fill_in('stylist', :with => 'The Hobbit')
#     click_button('Add')
#     click_link('The Hobbit')
#     fill_in("author", :with => "J.R.R. Tolkien")
#     click_button('Add')
#     expect(page).to have_content('J.R.R. Tolkien')
#   end
# end
