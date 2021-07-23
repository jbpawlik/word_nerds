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