require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

# Word Routes
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
  redirect to('/words')
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete
  redirect to('/words/:id')
end

#Definition routes
get('/words/:id/new') do
  @word = Word.find(params[:id].to_i())
  erb(:new_definition)
end

# get('/words/:id') do
#   @word = Word.find(params[:id].to_i())
#   definition = Definition.new({:meaning => params[:definition_meaning], :word_id => @word.id, :definition_id => nil})
#   definition.save
#   erb(:word)
# end

post('/words/:id') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new({:meaning => params[:definition_meaning], :word_id => @word.id, :definition_id => nil})
  definition.save
  erb(:word)
end

get('/words/:id/definitions/:definition_id') do
  @definition = Definition.find(params[:definition_id].to_i())
  @word = Word.find(params[:id].to_i())
  erb(:definition)
end

patch('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  @definition = Definition.find(params[:definition_id].to_i())
  @definition.update(params[:name])
  erb(:word)
end