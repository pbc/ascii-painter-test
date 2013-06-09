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
  end
end