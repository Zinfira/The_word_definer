require 'pry'

class Word
  attr_reader :id
  attr_accessor :text

  @@words = {}
  @@total_words = 0

  def initialize(text, id)
    @text = text
    @id = id || @@total_words += 1
  end

  def self.all
    @@words.values()
  end

  def save
    @@words[self.id] = Word.new(self.text, self.id)
  end

  def ==(word_to_compare)
    self.text() == word_to_compare.text()
  end

  def self.clear
    @@words = {}
    @@total_words = 0
  end

  def self.find(id)
    @@words[id]
  end

  def update(text)
    @text = text
  end

  def delete
    @@words.delete(self.id)
  end
end