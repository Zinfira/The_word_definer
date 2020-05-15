require 'rspec'
require 'word_definer'
require 'pry'

describe ('#Word') do
  describe ('.all') do
    it('returns am empty array when there are no words') do
      expect(Word.all).to(eq([]))
    end
  end
end