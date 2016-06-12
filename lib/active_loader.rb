# frozen_string_literal: true

require "active_loader/version"
require "active_loader/content_loader"
require "active_loader/loader_dispatcher"

module ActiveLoader
  def self.load(path, type:)
    meta_load(path, type)
  end

  def self.yaml(path)
    meta_load(path, :yaml)
  end
  singleton_class.send :alias_method, :yml, :yaml

  def self.json(path)
    meta_load(path, :json)
  end

  def self.meta_load(path, type)
    content = ContentLoader.new(path).call

    LoaderDispatcher.new(content, type).call
  end
  private_class_method :meta_load
end
