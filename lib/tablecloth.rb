require 'tablecloth/version'
require 'tablecloth/parser'

class Tablecloth

  def self.arrays(table)
    Tablecloth::Parser.new.arrays(table)
  end

  def self.hashes(table)
    Tablecloth::Parser.new.hashes(table)
  end

end
