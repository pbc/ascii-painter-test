module AsciiPainter
  class Processor

    def initialize
      @command_parser = CommandParser.new
    end

    def process_commands(commands)
      commands.each do |cm|
        parse_command(cm).execute
      end
    end

    def parse_command(command)
      command_parser.parse(command)
    end

    private

    def command_parser
      @command_parser
    end

  end
end