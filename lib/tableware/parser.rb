class Tableware

  class Parser

    class TableWithoutHeaderError < StandardError; end

    ROW_START = /^>?\s*\|?/
    ROW_END   = /\|?\s*$/

    def arrays(input)
      make_arrays(input)
    end

    def hashes(input)
      items = make_arrays(input)
      raise TableWithoutHeaderError, 'Sorry, only text tables with header rows can be turned into hashes' unless @headers
      items.map! { |row| @headers.zip(row).to_h }
    end

    private def make_arrays(input)
      lines = prepare_lines(input)
      lines[@data_start..-1].map do |line|
        parsed = parse_line(line)
        return [parsed] if @focused_line
        parsed
      end
    end

    private def prepare_lines(input)
      lines = input.strip.lines

      @data_start = lines[1] =~ /^\s*[-=\| ]+\s*$/ ? 2 : 0
      if @data_start.nonzero?
        @headers = parse_line(lines[0])
                   .map!(&:downcase)
                   .map! { |head| head.gsub(/\s+/, '_') }
                   .map!(&:to_sym)
      end

      lines
    end

    private def parse_line(line)
      line
        .strip
        .tap { |ln| @focused_line = ln[0] == '>' }
        .sub(ROW_START, '')
        .sub(ROW_END, '')
        .split(' | ')
        .map!(&:strip)
    end

  end

end
