module ActiveLoader
  class ParseError < StandardError
    def initialize(message, loader_name:)
      super(message)
      @loader_name = loader_name
    end
  end
end
