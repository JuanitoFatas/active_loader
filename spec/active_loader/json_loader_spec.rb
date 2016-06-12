require_relative "../../lib/active_loader/json_loader"

RSpec.describe ActiveLoader::JsonLoader do
  describe "#call" do
    def result
      described_class.new(json).call
    end

    context "Legitimate JSON" do
      let(:json) { %({"foo":"bar"}) }

      it "loads by JSON" do
        expect(result).to eq Hash("foo" => "bar")
      end
    end

    context "Invalid JSON" do
      let(:json) { %("") }

      it "raises parse error" do
        expect { result }.to raise_error ActiveLoader::ParseError
      end
    end
  end
end
