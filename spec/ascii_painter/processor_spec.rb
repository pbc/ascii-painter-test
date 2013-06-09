require "spec_helper"

describe AsciiPainter::Processor do
  let(:instance) { described_class.new }

  let(:clear_canvas_command) { "C" }
  let(:terminate_session_command) { "X" }

  let(:command_parser) { stub({}) }
  let(:command_object) { stub({}) }

  let(:valid_commands) {
    [ clear_canvas_command, terminate_session_command ]
  }

  before do
    instance.stub(:command_parser).and_return(command_parser)
  end

  context "#process_commands" do

    context "when list of commands is empty" do
      it "works correctly" do
        expect {
          instance.process_commands []
        }.not_to raise_error
      end
    end

    it "parses and executes all commands" do
      instance.should_receive(:parse_command).exactly(1).times.with(
        valid_commands[0]
      ).and_return(command_object)

      instance.should_receive(:parse_command).exactly(1).times.with(
        valid_commands[1]
      ).and_return(command_object)

      command_object.should_receive(:execute).exactly(2).times

      instance.process_commands(valid_commands)
    end
  end

  context "#parse_command" do
    it "parses command with a command parser" do
      command_parser.should_receive(:parse).exactly(1).times
      instance.parse_command(valid_commands)
    end

    it "returns command object" do
      command_parser.should_receive(:parse).and_return(command_object)
      expect(instance.parse_command(valid_commands)).to eq command_object
    end
  end

end

