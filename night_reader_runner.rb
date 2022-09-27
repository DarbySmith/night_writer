require './spec/spec_helper'

information = {
  message_file_path: ARGV[1],
  braille_file_path: ARGV[0]
}
night_reader = NightReader.new(information)
p night_reader.creation_message
night_reader.write_file_contents
english = night_reader.convert_to_english
night_reader.print_english_to_file(english)