class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: = nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', name, type)
  end

  def self.find(id, db)
    r = db.execute('SELECT * FROM pokemon WHERE id = ?', id)[0]
    self.new(id: id, db: db, name: r[1], type: r[2], hp: r[3])
  end

  def alter_hp(hp, db)
    db.execute('UPDATE pokemon SET hp = ? WHERE id = ? ', hp, self.id)
  end

end
