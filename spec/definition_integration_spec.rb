require 'simplecov'
SimpleCov.start
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('create a definition for the word', {:type => :feature}) do
  it('goes to the word page and writes a definition') do
    visit('/')
    click_on('Add a New Word')
    fill_in('name', :with => 'Heemdrol')
    click_on('So It Shall Be Written')
    click_on('Heemdrol')
    click_on('unless you do?')
    fill_in('definition_meaning', :with => 'porridge')
    click_on('So Shall It Be Done')
    expect(page).to have_content('porridge')
  end
end

describe('updates the definition for a word', {:type => :feature}) do
  it('goes to the definition edit page and updates the meaning') do
    visit('/')
    click_on('Heemdrol')
    click_on('porridge')
    fill_in('name', :with => 'slop')
    click_on('Change Definition')
    expect(page).to have_content('slop')
  end
end

describe('delete a definition', {:type => :feature}) do
  it('deletes a definition from the word page') do
    visit('/')
    click_on('Heemdrol')
    click_on('slop')
    click_on('Remove Definition')
    expect(page).to have_no_content('slop')
  end
end
