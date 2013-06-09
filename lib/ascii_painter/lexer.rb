module AsciiPainter
  class Lexer

    def analyse(tokens)
      if tokens.first == "X"
        [:call, nil, :terminate_session]
      elsif tokens.first == "C"
        [:call, nil, :clear_canvas]
      else
        raise StandardError.new("unknown token: #{tokens}")
      end
    end
  end
end