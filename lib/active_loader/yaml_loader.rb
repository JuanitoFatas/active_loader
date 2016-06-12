# frozen_string_literal: true

require "yaml"
require "active_loader/parse_error"

module ActiveLoader
  class YamlLoader
    def initialize(raw_content)
      @raw_content = raw_content.to_s
    end

    def call
      ensure_correct_type(safe_load)
    end

    private

      attr_reader :raw_content

      def safe_load
        YAML.safe_load(raw_content)
      rescue Psych::Exception, Psych::SyntaxError => exception
        raise ActiveLoader::ParseError.new(exception.message, loader_name: klass_name)
      end

      def klass_name
        @_klass_name ||= self.class.to_s
      end

      def ensure_correct_type(loaded_content)
        return nil if loaded_content.to_s.empty?

        if loaded_content.is_a? Hash
          loaded_content
        else
          raise ActiveLoader::ParseError.new("Must be a hash.", loader_name: klass_name)
        end
      end
  end
end
