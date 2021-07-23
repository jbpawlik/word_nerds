class Definition
  attr_reader :definition_id
  attr_accessor :meaning

    @@definitions = {}
    @@total_rows = 0

  def initialize(attributes)
    @meaning = attributes.fetch(:meaning)
    @definition_id = attributes.fetch(:definition_id) || @@total_rows += 1
  end

  def self.all
    @@definitions.values
  end

  def ==(definition_to_compare)
    self.meaning == definition_to_compare.meaning
  end

  def save
    @@definitions[self.id] = Definition.new({:meaning => self.meaning, :id => self.id})
  end

  def self.clear
    @@definitions = {}
    @@total_rows = 0
  end

  def self.find_by_word(wrd_id)
    definitions = []
    @@definitions.values.each do |definition|
      if definition.word_id == wrd_id
        definitions.push(definition)
      end
    end
    definitions
  end

  def self.find(id)
    @@definitions[id]
  end

  def update(meaning)
    @meaning = meaning
  end

  def delete
    @@definitions.delete(self.id)
  end

  def word
    Word.find(self.word_id)
  end

end
