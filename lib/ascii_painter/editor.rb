module AsciiPainter
  class Editor
    def initialize
      @processor = ::AsciiPainter::Processor.new
    end

    def process_commands(commands)
      processor.process_commands(commands)
    end

    private

    def processor
      @processor
    end
  end
end