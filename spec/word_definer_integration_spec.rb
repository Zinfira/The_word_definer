require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    click_on('Add a new Word')
    fill_in('new_word', :with => 'cat')
    click_on('Add a new Word')
    expect(page).to have_content('cat')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    text = Word.new("cat", nil)
    text.save
    visit("/words/#{text.id}")
    fill_in('definition', :with => 'It is a pet')
    click_on('Add a Definition')
    expect(page).to have_content('It is a pet')
  end
end