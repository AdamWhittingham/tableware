class Tablecloth

  class Parser

    ROW_START = /^\s*\|/
    ROW_END   = /\|\s*$/

    def arrays(input)
      make_arrays(input)
    end

    def hashes(input)
      items = make_arrays(input)
      items.map! { |row| @headers.zip(row).to_h }
    end

    private def make_arrays(input)
      lines = prepare_lines(input)
      lines[@data_start..-1].map { |line| parse_line(line) }
    end

    private def prepare_lines(input)
      lines = input.strip.lines

      @data_start = lines[1] =~ /^\s*[-=]+\s*$/ ? 2 : 0
      if @data_start.nonzero?
        @headers = parse_line(lines[0]).map!(&:downcase).map!(&:to_sym)
      end

      lines
    end

    private def parse_line(line)
      line
        .sub(ROW_START, '')
        .sub(ROW_END, '')
        .split('|')
        .map!(&:strip)
    end

  end

end
