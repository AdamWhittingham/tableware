require 'spec_helper'

describe Tableware::Parser do
  describe '.arrays' do
    let(:expected) do
      [
        %w[value_a value_b],
        %w[value_c value_d],
        %w[value_e value_f],
      ]
    end

    it 'parses a table without a header row' do
      input = '
        value_a  | value_b
        value_c  | value_d
        value_e  | value_f
      '

      expect(subject.arrays(input)).to eq expected
    end

    it 'parses a table with a header row' do
      input = '
        col_a    | col_b
        -------------------
        value_a  | value_b
        value_c  | value_d
        value_e  | value_f
      '

      expect(subject.arrays(input)).to eq expected
    end

    it 'parses a table with a header row with alternate formatting' do
      input = '   col_a  | col_b
                =========|=========
                value_a  | value_b
                value_c  | value_d
                value_e  | value_f '

      expect(subject.arrays(input)).to eq expected
    end

    it 'parses a table without side delimiters' do
      input = '
        value_a  | value_b
        value_c  | value_d
        value_e  | value_f
      '

      expect(subject.arrays(input)).to eq expected
    end

    it 'parses a table with side delimiters' do
      input = '
        | value_a  | value_b |
        | value_c  | value_d |
        | value_e  | value_f |
      '

      expect(subject.arrays(input)).to eq expected
    end

    it 'parses tables with columns including blank spaces' do
      input = '
        | value_a | value_b |         |
        | value_c |         | value_d |
        |         | value_e | value_f |
      '

      expect(subject.arrays(input)).to eq [
        ['value_a', 'value_b', ''],
        ['value_c', '', 'value_d'],
        ['', 'value_e', 'value_f'],
      ]
    end

    context 'when there is a line which starts with the `>` symbol' do
      it 'returns only that line' do
        input = '
        | value_a  | value_b |
      > | value_c  | value_d |
        | value_e  | value_f |
        '

        expect(subject.arrays(input)).to eq [%w[value_c value_d]]
      end
    end
  end

  describe '.hashes' do
    it 'parses tables with header rows' do
      input = '  col_a  |  col_b
               ---------+---------
               value_a  | value_b
               value_c  | value_d
               value_e  | value_f'

      expected = [
        { col_a: 'value_a', col_b: 'value_b' },
        { col_a: 'value_c', col_b: 'value_d' },
        { col_a: 'value_e', col_b: 'value_f' },
      ]

      expect(Tableware.hashes(input)).to eq expected
    end

    it 'does some simple transformations on headings to make them more like idiomatic Ruby symbols' do
      input = " | NOT very Idiomatic | VALID? |\n ---------- \n | 1 | 2 | "
      expect(Tableware.hashes(input)).to eq [{ not_very_idiomatic: '1', valid?: '2' }]
    end

    it 'raises a sensible exception if called on a table without a heading row' do
      input = ' | data | row | '
      expect { Tableware.hashes(input) }.to raise_error described_class::TableWithoutHeaderError
    end

    context 'when there is a line which starts with the `>` symbol' do
      it 'returns only that line' do
        input = '  col_a  |  col_b
               -------------------
               value_a  | value_b
            >  value_c  | value_d
               value_e  | value_f'

        expect(Tableware.hashes(input)).to eq [{ col_a: 'value_c', col_b: 'value_d' }]
      end
    end
  end
end
