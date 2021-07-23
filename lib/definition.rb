class Definition
  attr_reader :id
  attr_accessor :name

    @@definitions = {}
    @@total_rows = 0

  def initialize(attributes)
    @definition = attributes.fetch(:name)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def self.all
    @@definitions.values
  end

end
