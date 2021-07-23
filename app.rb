require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  redirect to('/words')
end

get('/words') do
  @words = Word.all()
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

post('/words') do
  name = params[:name]
  word = Word.new({:name => name, :id => nil})
  word.save
  redirect to('/words')
end
