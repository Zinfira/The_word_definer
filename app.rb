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

get('/words/new') do
  erb(:new_word)
end

post('/words') do
  new_word = params[:text]
  text = Word.new({:text => new_word})
  text.save()
  @texts = Word.all()
  erb(:home)
end