# frozen_string_literal: true

require "json"
require "active_loader/parse_error"

module ActiveLoader
  class JsonLoader
    def initialize(raw_content)
      @raw_content = raw_content.to_s
    end

    def call
      safe_load
    end

    private

      attr_reader :raw_content

      def safe_load
        JSON.parse(raw_content)
      rescue JSON::ParserError => exception
        raise ActiveLoader::ParseError.new(exception.message, loader_name: self.class.to_s)
      end
  end
end
