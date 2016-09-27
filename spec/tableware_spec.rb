require 'spec_helper'

describe Tableware do
  it 'has a version number' do
    expect(Tableware::VERSION).not_to be nil
  end

  let(:input) do
    '
      Hero        |    Value
      ----------------------
      Phara       |       10
      Mercy       |        9
      Winston     |        3
    '
  end

  describe '.arrays' do
    it 'parses a text table into a 2D array' do
      expected = [
        %w[Phara 10],
        %w[Mercy 9],
        %w[Winston 3],
      ]

      expect(Tableware.arrays(input)).to eq expected
    end
  end

  describe '.hashes' do
    it 'parases a text table into an array of hashes' do
      expected = [
        { hero: 'Phara',   value: '10' },
        { hero: 'Mercy',   value: '9' },
        { hero: 'Winston', value: '3' },
      ]

      expect(Tableware.hashes(input)).to eq expected
    end
  end
end
