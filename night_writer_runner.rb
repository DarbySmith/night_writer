require './spec/spec_helper'

information = {
  message_file_path: ARGV[0],
  braille_file_path: ARGV[1]
}
night_writer = NightWriter.new(information)
p night_writer.creation_message
night_writer.write_file_contents
braille = night_writer.convert_to_braille
night_writer.print_braille_to_file(braille)