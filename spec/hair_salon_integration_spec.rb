require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe("root path '/'", {:type => :feature}) do

  it('displays the homepage') do
    visit('/')
    expect(page).to have_content('The Rubyist Hair Salon')
  end

  it('displays an input field to enter new stylists') do
    visit('/')
    expect(page).to have_content('Add a Stylist')
  end

  it("displays no stylist list before stylists are saved") do
    visit('/')
    expect(page).not_to have_content('Stylist List:')
  end

  it('displays the stylist_form when user clicks on Add a Stylist link') do
    visit('/')
    click_link 'Add a Stylist'
    expect(page).to have_content('Add Stylist Form')
  end

  it('displays the Stylist list once at least one is saved') do
    visit('/')
    click_link 'Add a Stylist'
    fill_in 'name', :with => 'Joe Stylist'
    click_button 'Add'
    expect(page).to have_content 'Joe Stylist'
  end

  it('redisplays the page header after stylist is added') do
    visit('/')
    click_link 'Add a Stylist'
    fill_in 'name', :with => 'Joe Stylist'
    click_button 'Add'
    expect(page).to have_content 'The Rubyist Hair Salon'
  end

  it('displays stylist detail page on clicking a stylist name link') do
    visit('/')
    click_link 'Add a Stylist'
    fill_in 'name', :with => 'Joe Stylist'
    click_button 'Add'
    click_link 'Joe Stylist'
    expect(page).to have_content('Stylist Detail Page')
  end
end

describe('stylist detail page - /stylists/:id', {:type => :feature}) do

  it("displays the stylist's information") do
    visit('/')
    click_link 'Add a Stylist'
    fill_in 'name', :with => 'Joe Stylist'
    click_button 'Add'
    click_link 'Joe Stylist'
    expect(page).to have_css("h3", text: "Joe Stylist")
  end

  it('displays a delete button') do
    visit('/')
    click_link 'Add a Stylist'
    fill_in 'name', :with => 'Joe Stylist'
    click_button 'Add'
    click_link 'Joe Stylist'
    expect(page).to have_content('Delete This Stylist')
  end

  it('displays the homepage without the deleted stylist in the stylist list on delete') do
    visit('/')
    click_link 'Add a Stylist'
    fill_in 'name', :with => 'Joe Stylist'
    click_button 'Add'
    click_link 'Joe Stylist'
    click_button('Delete')
    expect(page).to_not have_content('Joe Stylist')
  end

  it('displays an Add Client link') do
    visit('/')
    click_link 'Add a Stylist'
    fill_in 'name', :with => 'Joe Stylist'
    click_button 'Add'
    click_link 'Joe Stylist'
    expect(page).to have_content('Add a Client')
  end

  it('displays the Add Client page on clicking Add a Stylist link') do
    visit('/')
    click_link 'Add a Stylist'
    fill_in 'name', :with => 'Joe Stylist'
    click_button 'Add'
    click_link 'Joe Stylist'
    click_link('Add a Client')
    expect(page).to have_content('Add Client Page')
  end
end

describe('Add client page') do

  it('display')

end


  # it('displays a stylist list once one is saved') do
  #   visit('/')
  #   fill_in('add_stylist', :with => 'Joe Stylist')
  #   click_button('Add')
  #   # save_and_open_page
  #   expect(page).to have_content('Joe Stylist')
  # end



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
