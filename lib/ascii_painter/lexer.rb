module AsciiPainter
  class Lexer

    def analyse(tokens)
      tokens = tokens + []
      create_call_node(tokens)
    end

    private

    def create_call_node(tokens)
      args_list_node = create_arg_list_node(tokens[1..-1])
      [:call, nil, tokens[0].to_sym, args_list_node]
    end

    def create_arg_list_node(tokens)
      list = [:arglist]
      tokens.each do |tok|
        list << create_value_node(tok)
      end
      list
    end

    def create_value_node(value)
      [:val, value]
    end

  end
end