require 'simplecov'
SimpleCov.start
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a path', {:type => :feature}) do
  it('goes to the home page') do
    visit('/')
    expect(page).to have_content('Word Nerds Preferred')
  end
end

describe('create a new word', {:type => :feature}) do
  it('creates a new word and goes to the word page') do
    visit('/')
    click_on('Add a New Word')
    fill_in('name', :with => 'Lordoone')
    click_on('So It Shall Be Written')
    expect(page).to have_content('Lordoone')
  end
end

describe('update a word name', {:type => :feature}) do
  it('goes to the edit word page and enters a new name') do
    visit('/')
    click_on('Lordoone')
    click_on('Edit Word')
    fill_in('name', :with => 'Drolene')
    click_on('Rename Word')
    expect(page).to have_content('Drolene')
  end
end

describe('delete a word', {:type => :feature}) do
  it('goes to the edit page and deletes the word') do
    visit('/')
    click_on('Drolene')
    click_on('Edit Word')
    click_on('Delete Word')
    expect(page).to have_no_content('Drolene')
  end
end


# describe('create a definition for the word', {:type => :feature}) do
#   it('goes to the word page and writes a definition') do
#     visit('/')
#     click_on('Lordoone')
#     click_on('Write a new definition')
#   end
# end

