require "spec_helper"

describe AsciiPainter::Lexer do
  let(:instance) { described_class.new }

  let(:call_without_arguments_tokens) { %w{X} }
  let(:call_with_arguments_tokens) { %w{I M N} }

  let(:call_without_arguments_ast) {
    [:call, nil, :X, [:arglist]]
  }
  let(:call_with_arguments_ast) {
    [:call, nil, :I, [:arglist, [:val, "M"], [:val, "N"]] ]
  }


  context "#analyse" do

    context "call without arguments" do
      it "returns correct AST" do
        expect(
          instance.analyse(call_without_arguments_tokens)
        ).to eq call_without_arguments_ast
      end
    end

    context "call with arguments" do
      it "returns correct AST" do
        expect(
          instance.analyse(call_with_arguments_tokens)
        ).to eq call_with_arguments_ast
      end
    end

  end
end
