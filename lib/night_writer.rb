require './lib/night_language'

class NightWriter < NightLanguage
  
  def convert_to_braille
    @braille_alphabet = Translator.new
    unformatted_braille =  []
    write_file_contents(@message_file_path, @braille_file_path).chars.each do |letter|
      unformatted_braille << @braille_alphabet.english_to_braille_alphabet[letter]
    end
    @braille_alphabet.braille_formatter(unformatted_braille)
  end

  def print_braille_to_file(braille)
    braille = convert_to_braille
    File.open(@braille_file_path, "w") { |file| file.write(braille)}
    File.read(@braille_file_path)
  end
end