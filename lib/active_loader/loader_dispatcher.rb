module ActiveLoader
  UnknownTypeError = Class.new(TypeError)

  class LoaderDispatcher
    def initialize(content, type)
      @content = content
      @type = type
    end

    def call
      if type == :json
        load_json
      elsif [:yaml, :yml].include?(type)
        load_yaml
      else
        raise UnknownTypeError, "Unknown type of file: #{type}."
      end
    end

    private

      attr_reader :content, :type

      def load_yaml
        require "active_loader/yaml_loader"
        YamlLoader.new(content).call
      end

      def load_json
        require "active_loader/json_loader"
        JsonLoader.new(content).call
      end
  end
end
