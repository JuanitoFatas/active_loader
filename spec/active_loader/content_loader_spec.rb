require_relative "../../lib/active_loader/content_loader"
require "http"

RSpec.describe ActiveLoader::ContentLoader do
  describe "#call" do
    def result
      described_class.new(path).call
    end

    context "nil" do
      let(:path) { nil }

      it "returns default content" do
        expect(result).to eq "{}"
      end
    end

    context "empty string" do
      let(:path) { "" }

      it "returns as is" do
        expect(result).to eq ""
      end
    end

    context "url" do
      let(:path) { "https://example.com/.travis.yml" }

      it "loads if url" do
        expect(HTTP).to receive(:get) { "foo: bar" }

        result
      end
    end

    context "file" do
      let(:path) { "/Users/Linus/.travis.yml" }

      it "loads if file" do
        expect(File).to receive(:file?) { true }
        expect(IO).to receive(:read)

        result
      end
    end

    context "content" do
      context "not nil" do
        let(:path) { "foo:\nbar" }

        it "returns as is" do
          expect(result).to eq "foo:\nbar"
        end
      end
    end
  end
end
