module AsciiPainter
  class Tokenizer
    def extract_tokens(command)
      command.strip.split(/\s/)
    end
  end
end