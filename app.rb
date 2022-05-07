require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  @words = Word.all
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

get('/words/:id') do
  "This route will show a specific word based on its ID. The value of ID here is #{params[:id]}."
end

post('/words') do
  name = params[:word_name]
  word = Word.new(name, nil)
  word.save()
  @words = Word.all()
  erb(:words)
end

get('/words/:id/edit') do
  "This will take us to a page with a form for updating a word with an ID of #{params[:id]}."
end

patch('/words/:id') do
  "This route will update a word."
end

delete('/words/:id') do
  "This route will delete a word."
end