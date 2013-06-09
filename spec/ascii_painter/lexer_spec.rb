require "spec_helper"

describe AsciiPainter::Lexer do
  let(:instance) { described_class.new }

  let(:terminate_session_tokens) { ["X"] }
  let(:clear_canvas_tokens) { ["C"] }

  let(:terminate_session_ast) { [:call, nil, :terminate_session] }
  let(:clear_canvas_ast) { [:call, nil, :clear_canvas] }


  context "#analyse" do
    context "command X" do
      it "returns correct AST" do
        expect( instance.analyse(terminate_session_tokens) ).to eq terminate_session_ast
      end
    end
  end
end
