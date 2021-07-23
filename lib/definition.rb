class Definition
  attr_reader :id
  attr_accessor :meaning

    @@definitions = {}
    @@total_rows = 0

  def initialize(attributes)
    @meaning = attributes.fetch(:meaning)
    @id = attributes.fetch(:id) || @@total_rows += 1
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

  def self.find(id)
    @@definitions[id]
  end

  

end
