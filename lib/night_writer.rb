class NightWriter
  attr_reader :message, :braille

  def initialize(information)
    @message = information[:message]
    @braille = information[:braille]
  end

  def creation_message
    "Created '#{@braille}' containing #{@message.chars.size} characters"
  end
end


information = {
  message: ARGV[0],
  braille: ARGV[1]
}
night_writer = NightWriter.new(information)
p night_writer.creation_message
