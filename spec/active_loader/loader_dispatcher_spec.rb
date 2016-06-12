require_relative "../../lib/active_loader/loader_dispatcher"
require_relative "../../lib/active_loader/yaml_loader"
require_relative "../../lib/active_loader/json_loader"

RSpec.describe ActiveLoader::LoaderDispatcher do
  describe "#call" do
    def result
      described_class.new("does not matter here", type).call
    end

    context "YAML type" do
      let(:type) { [:yaml, :yml].sample }

      it "invokes YamlLoader" do
        expect(ActiveLoader::YamlLoader).to receive_message_chain(:new, :call)

        result
      end
    end

    context "JSON type" do
      let(:type) { :json }

      it "invokes JsonLoader" do
        expect(ActiveLoader::JsonLoader).to receive_message_chain(:new, :call)

        result
      end
    end

    context "Unknown type" do
      let(:type) { :exe }

      it "raises unknown type error" do
        expect { result }.to raise_error(ActiveLoader::UnknownTypeError)
      end
    end
  end
end
