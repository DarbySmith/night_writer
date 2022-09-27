class NightLanguage
  attr_reader :message_file_path, :braille_file_path

  def initialize(information)
    @message_file_path = information[:message_file_path]
    @braille_file_path = information[:braille_file_path]
  end

  def creation_message(incoming, outgoing)
    character_count = File.read(incoming).chars.size
    "Created '#{outgoing}' containing #{character_count} characters"
  end

  def write_file_contents(incoming, outgoing)
    message_content = File.read(incoming)
    File.open(outgoing, "w") { |file| file.write(message_content) }
    File.read(outgoing)
  end
end