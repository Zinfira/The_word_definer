class Definition 
  attr_reader :id
  attr_accessor :content, :text_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(content, text_id, id)
    @content = content
    @text_id = text_id
    @id = id || @@total_rows += 1
  end

  def ==(definition_to_compare)
    (self.content() == definition_to_compare.content()) && (self.text_id() == definition_to_compare.text_id())
  end

  def self.all
    @@definitions.values
  end

  def save
    @@definitions[self.id] = Definition.new(self.content, self.text_id, self.id)
  end

  def self.clear
    @@definitions = {}
  end

  def update(content, text_id)
    self.content = content
    self.text_id = text_id
    @@definitions[self.id] = Definition.new(self.content, self.text_id, self.id)
  end

  def self.find(id)
    @@definitions[id]
  end
end

