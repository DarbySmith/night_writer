require './lib/braille'

class NightWriter
  attr_reader :message_file_path, :braille_file_path

  def initialize(information)
    @message_file_path = information[:message_file_path]
    @braille_file_path = information[:braille_file_path]
  end
  
  def creation_message
    character_count = File.read(@message_file_path).chars.size
    "Created '#{@braille_file_path}' containing #{character_count} characters"
  end
  
  def write_file_contents
    message_content = File.read(@message_file_path)
    File.open(@braille_file_path, "w") { |file| file.write(message_content) }
    File.read(@braille_file_path)
  end
  
  def convert_to_braille
    @braille_alphabet = Braille.new
    unformatted_braille = write_file_contents.chars.map do |letter|
      if letter == " "
        braille_letter = @braille_alphabet.alphabet[:space]
      else
        braille_letter = @braille_alphabet.alphabet[letter.to_sym]
      end
    end
    @braille_alphabet.braille_formatter(unformatted_braille)
  end

  def print_braille_to_file(braille)
    braille = convert_to_braille
    File.open(@braille_file_path, "w") { |file| file.write(braille)}
    File.read(@braille_file_path)
  end
  # File.open(@braille_file_path, "w") { |file| file.write(braille_text)}
end


information = {
  message_file_path: ARGV[0],
  braille_file_path: ARGV[1]
}
night_writer = NightWriter.new(information)
p night_writer.creation_message
night_writer.write_file_contents
braille = night_writer.convert_to_braille
night_writer.print_braille_to_file(braille)
