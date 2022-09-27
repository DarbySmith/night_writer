require './lib/night_language'

class NightReader < NightLanguage

  def convert_to_english
    translator = Translator.new
    break_into_column = combine_multiple_lines.map do |line|
      line.scan(/.{2}/)
    end
    braille_letters = break_into_column[0].zip(break_into_column[1],break_into_column[2])
    english_letter = braille_letters.map do |letter|
      translator.braille_to_english_alphabet[letter]
    end
    english_letter.join
    # translator = Translator.new
    # multi_line_braille = Hash.new {|h,k| h[k] = []}
    # braille_in_lines = File.readlines(@message_file_path).each_slice(3).to_a
    # braille_in_lines.each do |row_group|
    #   multi_line_braille[1] << row_group[0].delete("\n")
    #   multi_line_braille[2] << row_group[1].delete("\n")
    #   multi_line_braille[3] << row_group[2].delete("\n")
    # end
    # one_line_braille = [multi_line_braille[1].join, multi_line_braille[2].join, multi_line_braille[3].join]

    # into_column = one_line_braille.map do |line|
    #   line.scan(/.{2}/)
    # end
    # braille_letters = into_column[0].zip(into_column[1],into_column[2])
    # english_letter = braille_letters.map do |letter|
    #   translator.braille_to_english_alphabet[letter]
    # end
    # english_letter.join
  end

  def combine_multiple_lines
    multi_line_braille = Hash.new {|h,k| h[k] = []}
    braille_in_lines = File.readlines(@message_file_path).each_slice(3).to_a
    braille_in_lines.each do |row_group|
      multi_line_braille[1] << row_group[0].delete("\n")
      multi_line_braille[2] << row_group[1].delete("\n")
      multi_line_braille[3] << row_group[2].delete("\n")
    end
    one_line_braille = [multi_line_braille[1].join, multi_line_braille[2].join, multi_line_braille[3].join]
  end

  def print_english_to_file(english)
    english = convert_to_english
    File.open(@message_file_path, "w") { |file| file.write(english)}
    File.read(@message_file_path)
  end
end