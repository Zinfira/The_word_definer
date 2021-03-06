require 'rspec'
require 'word_definer'
require 'definition'
require 'pry'

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
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

  describe('.all') do
    it('returns a list of all definitions') do
      definition1 = Definition.new("it is a pet", @text.id, nil)
      definition1.save()
      definition2 = Definition.new("it meows", @text.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition1, definition2]))
    end
  end

  describe('#save') do
    it('saves a definition') do
      definition1 = Definition.new("it is a pet", @text.id, nil)
      definition1.save()
      expect(Definition.all).to(eq([definition1]))
    end
  end

  describe('.clear') do
    it('clears all definitions') do
      definition1 = Definition.new("it is a pet", @text.id, nil)
      definition1.save()
      definition2 = Definition.new("it meows", @text.id, nil)
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#update') do
    it('updates a definition by id') do
      definition1 = Definition.new("it is a pet", @text.id, nil)
      definition1.save()
      definition1.update("it likes to sleep in warm places", @text.id)
      expect(definition1.content).to(eq("it likes to sleep in warm places"))
    end
  end

  describe('.find') do
    it('finds a definition by id') do
      definition1 = Definition.new("it is a pet", @text.id, nil)
      definition1.save()
      definition2 = Definition.new("it meows", @text.id, nil)
      definition2.save()
      expect(Definition.find(definition1.id)).to(eq(definition1))
    end
  end

  describe('#delete') do
    it('deletes a definition by id') do
      definition1 = Definition.new("it is a pet", @text.id, nil)
      definition1.save()
      definition2 = Definition.new("it meows", @text.id, nil)
      definition2.save()
      definition1.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end

  describe('.find_by_word') do
    it('finds definitions for a word') do
      word2 = Word.new("pizza", nil)
      word2.save()
      definition1 = Definition.new("it is a pet", @text.id, nil)
      definition1.save()
      definition2 = Definition.new("it is food", word2.id, nil)
      definition2.save()
      expect(Definition.find_by_word(word2.id)).to(eq([definition2]))
    end
  end

  describe('#word') do
    it("finds the word a definition belongs to") do
      word = Word.new("dog", nil)
      word.save()
      definition = Definition.new("it is a pet", @text.id, nil)
      definition.save()
      expect(definition.word()).to(eq(@text))
    end
  end
end