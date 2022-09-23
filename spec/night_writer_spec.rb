require 'spec_helper'

RSpec.describe NightWriter do
  before (:each) do
    information = {
      message: 'message.txt',
      braille: 'braille.txt'
    }
    @night_writer = NightWriter.new(information)
  end
  
  describe '#initialize' do
    it 'exists' do
      expect(@night_writer).to be_instance_of(NightWriter)
    end
    
    it 'has a message' do
      expect(@night_writer.message).to eq('message.txt')
    end
    
    it 'has braille' do
      expect(@night_writer.braille).to eq('braille.txt')
    end
  end
  
  describe '#creation_message' do
    it 'returns a message with details for the file' do
      expect(@night_writer.creation_message).to eq("Created 'braille.txt' containing 11 characters")
    end
  end
end