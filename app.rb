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

get('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

get('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:name])
  @words = Word.all
  erb(:words)
end