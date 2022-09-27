require 'spec_helper'

RSpec.describe NightReader do
  before (:each) do
    information = {
      message_file_path: 'message_spec.txt',
      braille_file_path: 'braille_spec.txt'
    }
    @night_reader = NightReader.new(information)
  end
  
  describe '#initialize' do
    it 'exists' do
      expect(@night_reader).to be_instance_of(NightReader)
    end
    
    it 'has braille' do
      expect(@night_reader.braille_file_path).to eq('braille_spec.txt')
    end

    it 'has a message' do
      expect(@night_reader.message_file_path).to eq('message_spec.txt')
    end
  end

  describe '#creation_message' do
    it 'prints a message with the second file argument and number of characters' do
      expect(@night_reader.creation_message(@night_reader.braille_file_path, @night_reader.message_file_path)).to eq("Created 'message_spec.txt' containing 69 characters")
    end
  end

  describe '#write_file_contents' do
    it 'copies the file message to the braille file' do
      hello_world = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
      expect(@night_reader.write_file_contents(@night_reader.braille_file_path, @night_reader.message_file_path)).to eq(hello_world)
    end
  end

  describe '#convert_to_english' do
    it 'converts braille into english' do
      braille = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0..."
      expect(@night_reader.convert_to_english).to eq('hello world')
    end
  end
  
  describe '#combine_multiple_lines' do
    it 'combines multiple lines of braille into one' do
      # convert message to original form
      message_unformatted = [
        ["0.","00",".."],
        [".0","0.",".."],
        ["..","..",".."],
        ["00","..","0."],
        ["00",".0","00"],
        ["..","..",".."],
        ["00",".0","0."],
        ["0.","..",".."],
        ["00","..","0."],
        ["0.",".0",".."],
        ["..","..",".."],
        [".0","0.",".."],
        [".0","0.","0."],
        ["..","..",".."],
        ["00",".0",".."],
        ["0.","..",".."], 
        ["0.","00","0."],
        ["0.","0.",".."],
        ["00",".0","00"],
        ["..","..",".."],
        ["0.","..",".."],
        ["00",".0","0."],
        ["00",".0",".."],
        ["..","..",".."],
        [".0","0.",".."],
        ["..","..",".."],
        ["0.","0.","0."],
        [".0","0.",".."],
        ["0.","0.","00"],
        ["0.",".0",".."],
        ["..","..",".."],
        [".0","0.",".."],
        ["00",".0","0."],
        ["..","..",".."],
        ["0.","00",".."],
        ["0.",".0","0."],
        [".0","0.","0."],
        ["00","..",".."],
        ["0.","00",".."],
        [".0","00","0."],
        ["0.",".0","0."],
        ["00",".0","0."],
        ["..","..",".."],
        ["00","00",".."],
        ["0.","..",".."],
        ["..","..",".."],
        [".0","00",".0"],
        ["0.","00",".."],
        [".0","0.",".."],
        ["00","..",".."],
        ["0.","00",".."],
        ["..","..",".."],
        [".0","0.",".."],
        [".0","0.","0."],
        ["..","..",".."],
        [".0","0.",".."],
        ["00",".0","0."],
        ["..","..",".."],
        [".0","00","0."],
        ["0.","00",".."],
        ["0.",".0",".."],
        ["..","..",".."],
        [".0","0.","0."],
        ["0.",".0","0."],
        ["0.","..","00"],
        [".0","00","0."],
        ["0.","00",".."],
        ["0.",".0",".."],
        ["0.","..",".."],
        [".0","0.","0."],
        [".0","00","0."]
      ]
      message = ["0..0..0000..000.000....0.0..000.0.0.00..0.0000...0..0..00.0....000..0.0..0000..00.00..000....00..0000....0.0...000...00.0....00.0..00.0.0..0.0","000......0...0.....0..0.0....0..000..0.....0.0..0...0.0.0..0..0..0..00.00...0000.0.0..00....00000...00..0.0...0..0..0000.0..0..0..0000.0..0.00", "......0.00..0...0.......0.......0...00....0.........0...00......0.....0.0.....0.0.0..........0............0.....0...0.......0.0.000.......0.0."]
      allow(@night_reader).to receive(:braille_in_lines).and_return(message_unformatted)
      expect(@night_reader.combine_multiple_lines).to eq(message)
    end
  end

  describe '#braille_in_lines' do
    it 'returns the unformatted message' do
      sliced_braille = [["0.0.0.0.0....00.0.0.00\n", "00.00.0..0..00.0000..0\n", "....0.0.0....00.0.0...\n"]]
      expect(@night_reader.braille_in_lines).to eq(sliced_braille)
    end
  end

  describe '#print_englsih_to_file' do
    it 'prints the braille in english' do
      expect(@night_reader.print_english_to_file(@night_reader.convert_to_english)).to eq('hello world')
    end
  end
end