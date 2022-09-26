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
end