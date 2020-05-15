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
end

