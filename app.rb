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
  redirect to('/words')
end

#Definition routes

get('/words/:id/new') do
  @definitions = Definition.all
  @words = Word.all()
  @word = Word.find(params[:id].to_i())
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:new_definition)
end

# Post a new definition. After the definition is added, Sinatra will route to the view for the word the definition belongs to.
post('/words/:id') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new({:meaning => nil, :definition_id => nil})
  definition.save()
  erb(:word)
end

# Get the definition for a specific word.
get('/word/:id/definitions/:definition_id') do
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:definition)
end



# Edit a definition and then route back to the word view.
patch('/word/:id') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.find(params[:definition_id].to_i())
  definition.update(params[:name], @word.id)
  erb(:word)
end

# Delete a definition and then route back to the word view.
delete('/word/:id/definitions/:definition_id') do
  definition = Definition.find(params[:definition_id].to_i())
  definition.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end
