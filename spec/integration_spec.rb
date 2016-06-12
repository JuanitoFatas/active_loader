RSpec.describe "Integration Specs" do
  context "JSON" do
    it "can load" do
      json = IO.read("spec/fixtures/github/users/juanitofatas.json")

      expect { ActiveLoader.load json, type: :json }.not_to raise_error
      expect { ActiveLoader.json json }.not_to raise_error
    end
  end

  context "YAML" do
    pending "can load rails app's database.yml" do
      yaml = IO.read("spec/fixtures/rails/database.yml")

      expect { ActiveLoader.load yaml, type: :yaml }.not_to raise_error
      expect { ActiveLoader.yaml yaml }.not_to raise_error
    end

    it "can load rails/rails's .travis.yml" do
      yaml = IO.read("spec/fixtures/github/rails/.travis.yml")

      expect { ActiveLoader.load yaml, type: :yml }.not_to raise_error
      expect { ActiveLoader.yaml yaml }.not_to raise_error
    end
  end
end
