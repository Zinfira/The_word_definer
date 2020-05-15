require 'rspec'
require 'word_definer'
require 'pry'

describe ('#Word') do
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

end