require "spec_helper"

describe AsciiPainter::Editor do
  let(:instance) { described_class.new }

  let(:clear_canvas_command) { "C" }
  let(:terminate_session_command) { "X" }

  let(:valid_commands) {
    [ clear_canvas_command, terminate_session_command ]
  }

  let(:processor) { stub({:execute_command => true}) }

  before do
    instance.stub(:processor).and_return(processor)
  end

  context "#process_commands" do
    it "processes commands with a processor" do
      processor.should_receive(:process_commands).with(
        valid_commands
      ).exactly(1).times
      instance.process_commands(valid_commands)
    end
  end

end

