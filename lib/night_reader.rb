class NightReader
  attr_reader :message_file_path, :braille_file_path

  def initialize(information)
    @message_file_path = information[:message_file_path]
    @braille_file_path = information[:braille_file_path]
  end

  def creation_message
    character_count = File.read(@braille_file_path).chars.size
    "Created '#{@message_file_path}' containing #{character_count} characters"
  end

  def write_file_contents
    message_content = File.read(@braille_file_path)
    File.open(@message_file_path, "w") { |file| file.write(message_content) }
    File.read(@message_file_path)
  end

  def convert_to_english
    translator = Translator.new
    multi_line_braille = Hash.new {|h,k| h[k] = []}
    braille_in_lines = File.readlines(@message_file_path).each_slice(3).to_a
    braille_in_lines.each do |row_group|
      multi_line_braille[1] << row_group[0].delete("\n")
      multi_line_braille[2] << row_group[1].delete("\n")
      multi_line_braille[3] << row_group[2].delete("\n")
    end
    one_line_braille = [multi_line_braille[1].join, multi_line_braille[2].join, multi_line_braille[3].join]


    # braille_in_lines = File.readlines(@message_file_path)
    into_column = one_line_braille.map do |line|
      line.scan(/.{2}/)
    end
    braille_letters = into_column[0].zip(into_column[1],into_column[2])
    english_letter = braille_letters.map do |letter|
      translator.braille_to_english_alphabet[letter]
    end
    english_letter.join
    # translator = Translator.new
    # braille_in_lines = File.readlines(@message_file_path)
    # into_column = braille_in_lines.map do |line|
    #   line.scan(/.{2}/)
    # end
    # braille_letters = into_column[0].zip(into_column[1],into_column[2])
    # english_letter = braille_letters.map do |letter|
    #   translator.braille_to_english_alphabet[letter]
    # end
    # english_letter.join
  end

  def combine_multiple_lines
    require 'pry'; binding.pry
    x = write_file_contents
  end

  def print_english_to_file(english)
    english = convert_to_english
    File.open(@message_file_path, "w") { |file| file.write(english)}
    File.read(@message_file_path)
  end
end