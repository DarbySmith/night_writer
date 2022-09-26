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
      expect(@night_reader.creation_message).to eq("Created 'message_spec.txt' containing 69 characters")
    end
  end
end