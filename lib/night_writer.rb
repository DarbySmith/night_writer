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
end


information = {
  message_file_path: ARGV[0],
  braille_file_path: ARGV[1]
}
night_writer = NightWriter.new(information)
p night_writer.creation_message
