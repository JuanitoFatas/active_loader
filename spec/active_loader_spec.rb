require "spec_helper"

RSpec.describe ActiveLoader do
  it "has a version number" do
    expect(ActiveLoader::VERSION).not_to be nil
  end

  def yaml
    @_yaml ||= <<-JSON
      foo:
        bar
    JSON
  end

  def json
    @_json ||= <<-JSON
      { "foo": "bar" }
    JSON
  end

  def expected_result
    @_expected_result ||= Hash("foo" => "bar")
  end

  describe ".load" do
    def load(content, type)
      ActiveLoader.load content, type: type
    end

    context "yaml" do
      it "loads using YAML" do
        expect(load(yaml, :yaml)).to eq expected_result
      end
    end

    context "json" do
      it "loads using JSON" do
        expect(load(json, :json)).to eq expected_result
      end
    end
  end

  describe ".yaml" do
    it "loads using YAML" do
      expect(ActiveLoader.yaml(yaml)).to eq expected_result
    end
  end

  describe ".yml" do
    it "loads using YAML" do
      expect(ActiveLoader.yaml(yaml)).to eq expected_result
    end
  end

  describe ".json" do
    it "loads using JSON" do
      expect(ActiveLoader.json(json)).to eq expected_result
    end
  end

  it "unknown type" do
    expect { ActiveLoader.load("", type: :rar) }.to raise_error ActiveLoader::UnknownTypeError
  end
end
