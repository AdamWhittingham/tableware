require 'spec_helper'

describe Tablecloth::Parser do
  describe '.arrays' do
    let(:expected) do
      [
        %w[value_a value_b],
        %w[value_c value_d],
        %w[value_e value_f]
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
        ['', 'value_e', 'value_f']
      ]
    end
  end
end
