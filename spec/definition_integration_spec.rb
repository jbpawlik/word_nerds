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
