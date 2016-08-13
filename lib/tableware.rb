require 'tableware/version'
require 'tableware/parser'

class Tableware

  def self.arrays(table)
    Tableware::Parser.new.arrays(table)
  end

  def self.hashes(table)
    Tableware::Parser.new.hashes(table)
  end

end
