require 'rspec'
require 'word_definer'
require 'definition'
require 'pry'

describe ('#Word') do

  before(:each) do
    Word.clear()
    Definition.clear()
  end

  describe ('.all') do
    it('returns am empty array when there are no words') do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves words') do
      word1 = Word.new("cat", nil)
      word1.save()
      word2 = Word.new("pizza", nil)
      word2.save()
      expect(Word.all).to(eq([word1, word2]))
    end
  end

  describe('#==') do
    it('is the same word if it has the same attributes as another word') do
      word1 = Word.new("cat", nil)
      word2 = Word.new("cat", nil)
      expect(word1).to(eq(word2))
    end
  end

  describe('.clear') do
    it('clears all words') do
      word1 = Word.new("cat", nil)
      word1.save()
      word2 = Word.new("pizza", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it('finds a word by id') do
      word1 = Word.new("cat", nil)
      word1.save()
      word2 = Word.new("pizza", nil)
      word2.save()
      expect(Word.find(word1.id)).to(eq(word1))
    end
  end

  describe('#update') do
    it('updates a word') do
      word1 = Word.new("cat", nil)
      word1.save()
      word1.update("kitten")
      expect(word1.text).to(eq("kitten"))
    end
  end

  describe('#delete') do
    it('deletes a word by id') do
      word1 = Word.new("cat", nil)
      word1.save()
      word2 = Word.new("pizza", nil)
      word2.save()
      word1.delete()
      expect(Word.all).to(eq([word2]))
    end
  end

  describe('#definitions') do
    it("returns a word's definitions") do
      word = Word.new("cat", nil)
      word.save()
      definition1 = Definition.new("it is a pet", word.id, nil)
      definition1.save()
      definition2 = Definition.new("it meows", word.id, nil)
      definition2.save()
      expect(word.definitions).to(eq([definition1, definition2]))
    end
  end
end