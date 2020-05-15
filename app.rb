require('sinatra')
require('sinatra/reloader')
require('./lib/word_definer')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @texts = Word.all
  erb(:home)
end

get('/words') do
  @texts = Word.all
  erb(:home)
end

get('words/:id') do
  @text = Word.find(params[:id].to_i())
  erb(:word)
end

get('/words/new') do
  erb(:new_word)
end

post('/words') do
  text = params[:new_word]
  text = Word.new(text, nil)
  text.save()
  @texts = Word.all
  erb(:home)
end

get('/words/:id') do
  @text = Word.find(params[:id].to_i())
  erb(:word)
end

get('/words/:id/edit') do
  @text = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch('/words/:id') do
  @text = Word.find(params[:id].to_i())
  @text.update(params[:new_word])
  @texts = Word.all
  erb(:home)
end