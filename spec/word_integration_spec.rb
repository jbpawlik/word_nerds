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
