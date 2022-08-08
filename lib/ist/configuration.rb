# frozen_string_literal: true

module Ist
  # Class for save configurable attributes for usage
  class Configuration
    DOWNLOAD_DIR = "scraped_files"

    attr_reader :file, :options, :dir_name

    def initialize(file, options = {})
      @file = file
      @options = options
      @dir_name = options.key?(:dir_name) ? options[:dir_name] : DOWNLOAD_DIR
    end
  end
end
