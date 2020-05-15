require 'rspec'
require 'word_definer'
require 'definition'
require 'pry'

describe '#Definition' do

  before(:each) do
    Word.clear()
    @text = Word.new("cat", nil)
    @text.save()
  end

  describe('#==') do
    it('is the same definition if it has the same attributes as another definition') do
      definition1 = Definition.new("it is a pet", @text.id, nil)
      definition2 = Definition.new("it is a pet", @text.id, nil)
      expect(definition1).to(eq(definition2))
    end
  end
end