class Pokemon
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type 
    @db = db
  end
  
  def self.save(name, type, db)
    found_pokemon = db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
    Pokemon.new(id: found_pokemon[0], name: found_pokemon)
  end
  
  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    
  end
end
