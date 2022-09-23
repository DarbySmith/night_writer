require 'spec_helper'

RSpec.describe NightWriter do
  before (:each) do
    information = {
      message_file_path: 'message_spec.txt',
      braille_file_path: 'braille_spec.txt'
    }
    @night_writer = NightWriter.new(information)
  end
  
  describe '#initialize' do
    it 'exists' do
      expect(@night_writer).to be_instance_of(NightWriter)
    end
    
    it 'has a message' do
      expect(@night_writer.message_file_path).to eq('message_spec.txt')
    end
    
    it 'has braille' do
      expect(@night_writer.braille_file_path).to eq('braille_spec.txt')
    end
  end
  
  describe '#creation_message' do
    it 'returns a message with details for the file' do
      expect(@night_writer.creation_message).to eq("Created 'braille_spec.txt' containing 11 characters")
    end
  end

  describe '#write_file_contents' do
    it 'copies the file message to the braille file' do
      expect(@night_writer.write_file_contents).to eq('hello world')
    end
  end
end