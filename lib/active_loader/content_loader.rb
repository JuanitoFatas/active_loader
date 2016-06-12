# frozen_string_literal: true

module ActiveLoader
  class ContentLoader
    def initialize(path)
      @path = path
    end

    def call
      return default_content unless path

      if url?
        require "http"
        HTTP.get(path).to_s
      elsif file?
        IO.read(path)
      else
        path
      end
    end

    private

      attr_reader :path

      def default_content
        "{}"
      end

      def url?
        return false if path.empty?

        require "uri"
        !!URI.parse(path).scheme
      rescue URI::BadURIError, URI::InvalidURIError
        false
      end

      def file?
        File.file?(path)
      end
  end
end
