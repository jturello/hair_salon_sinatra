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

  it('displays the homepage without the deleted stylist in the stylist list after delete') do
    visit('/')
    click_link 'Add a Stylist'
    fill_in 'name', :with => 'Joe Stylist'
    click_button 'Add'
    click_link 'Joe Stylist'
    click_button('Delete')
    expect(page).to_not have_content('Joe Stylist')
  end

  it('displays no client list if stylist has none') do
    visit('/')
    click_link 'Add a Stylist'
    fill_in 'name', :with => 'Joe Stylist'
    click_button 'Add'
    click_link 'Joe Stylist'
    expect(page).to have_content('stylist has no clients')
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

  it('displays a client list when stylist has clients') do
    visit('/')
    click_link 'Add a Stylist'
    fill_in 'name', :with => 'Joe Stylist'
    click_button 'Add'
    click_link 'Joe Stylist'
    click_link('Add a Client')
    fill_in('name', :with => 'Brenda Lee Johnson')
    click_button('Add Client')
    expect(page).to have_content('Brenda Lee Johnson')
  end
end

describe('stylist update functionality', {:type => :feature}) do

  it('displays updated stylist name on stylist/:id page') do
    visit('/')
    click_link 'Add a Stylist'
    fill_in 'name', :with => 'Original Name'
    click_button 'Add'
    click_link 'Original Name'
    fill_in('new_name', :with => 'Updated Name')
    click_button('Update')
    expect(page).to have_content('Updated Name')
  end
end
