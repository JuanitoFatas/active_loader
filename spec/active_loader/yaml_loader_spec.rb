require_relative "../../lib/active_loader/yaml_loader"

RSpec.describe ActiveLoader::YamlLoader do
  describe "#call" do
    def result
      described_class.new(yaml).call
    end

    context "empty string" do
      let(:yaml) { "" }

      it "returns nil" do
        expect(result).to be nil
      end
    end

    context "Legitimate YAML" do
      let(:yaml) { "foo:\n  bar" }

      it "loads by YAML" do
        expect(result).to eq Hash("foo" => "bar")
      end
    end

    context "Invalid YAML" do
      let(:yaml) { %("--") }

      it "raises parse error" do
        expect { result }.to raise_error ActiveLoader::ParseError
      end
    end

    context "Invalid load" do
      let(:yaml) { %("--") }

      it "loaded array raises parse error" do
        expect(YAML).to receive(:safe_load) { [] }

        expect { result }.to raise_error ActiveLoader::ParseError, "Must be a hash."
      end
    end
  end
end
