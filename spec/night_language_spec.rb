require 'spec_helper'

RSpec.describe NightLanguage do
  before (:each) do
    information = {
      message_file_path: 'message_spec.txt',
      braille_file_path: 'braille_spec.txt'
    }
    @night_language = NightLanguage.new(information)
  end
  
  describe '#initialize' do
    it 'exists' do
      expect(@night_language).to be_instance_of(NightLanguage)
    end
    
    it 'has braille' do
      expect(@night_language.braille_file_path).to eq('braille_spec.txt')
    end

    it 'has a message' do
      expect(@night_language.message_file_path).to eq('message_spec.txt')
    end
  end

  describe '#creation_message' do
    it 'prints a message with the second file argument and number of characters' do
      expect(@night_language.creation_message(@night_language.braille_file_path, @night_language.message_file_path)).to eq("Created 'message_spec.txt' containing 69 characters")
    end
  end

  describe '#write_file_contents' do
    it 'copies the file message to the braille file' do
      hello_world = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
      expect(@night_language.write_file_contents(@night_language.braille_file_path, @night_language.message_file_path)).to eq(hello_world)
    end
  end
end
