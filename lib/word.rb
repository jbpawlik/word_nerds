class Word

    @@words = {}
    @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetc(:id) || @@total_rows += 1
  end

  def self.all
    @@words.values
  end
  
end