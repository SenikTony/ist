# frozen_string_literal: true

require "ist/log_writer"
require "ist/document"

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
      # destination_folder = DestinationFolder.new(config.dir_name, logger)

      if document.valid? # && destination_folder.valid?
        logger.info_msg("Run scraper")
        # Scraper.run(file, destination_folder, logger)
      else
        logger.error_msg(document.errors.full_messages)
      end
    end

    private

    def logger
      @logger ||= Ist::LogWriter.new(stdout: $stdout)
    end

    def document
      @document ||= Document.new(config.file, logger)
    end
  end
end
