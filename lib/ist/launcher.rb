# frozen_string_literal: true

require "ist/log_writer"

module Ist
  # Launch scrap process
  class Launcher
    attr_reader :config

    def self.call(*args)
      new(*args).call
    end

    def initialize(config:)
      @config = config
    end

    def call
      logger = Ist::LogWriter.new(stdout: $stdout)
      logger.info_msg("Run scraper process")
      # file = Document.new(config.file, logger)
      # destination_folder = DestinationFolder.new(config.dir_name, logger)

      # if file.valid? && destination_folder.valid?
      #   Run scraper
      #   Scraper.run(file, destination_folder, logger)
      # else
      #   Print validation error
      #   logger.error_msg("Error message...")
      # end
    end
  end
end
