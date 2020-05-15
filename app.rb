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