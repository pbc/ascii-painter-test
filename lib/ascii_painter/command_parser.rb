module AsciiPainter
  class CommandParser

    def initialize
      @tokenizer = ::AsciiPainter::Tokenizer.new
      @lexer = ::AsciiPainter::Lexer.new
    end

    def parse(command)
      generate_ast(command)
    end

    private

    def tokenizer
      @tokenizer
    end

    def lexer
      @lexer
    end

    def generate_ast(command)
      tokens = tokenizer.extract_tokens(command)
      lexer.analyse(tokens)
    end

    def analyse_tokens(tokens)

    end

    def parse_command(command)
      # nothing here yet :)
    end

    def show_contents_command
      AsciiPainter::Commands::ShowContents.new
    end

    def terminate_session_command
      AsciiPainter::Commands::TerminateSession.new
    end

  end
end