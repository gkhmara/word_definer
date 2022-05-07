class Word
  @@words = {}

  def initialize(name)
    @name = name
  end

  def self.all
    @@words.values()
  end

end