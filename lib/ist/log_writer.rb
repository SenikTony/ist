# frozen_string_literal: true

require "logger"

module Ist
  # Write log for work
  class LogWriter
    attr_reader :stdout, :default_log_level, :logger

    def initialize(stdout:)
      @stdout = stdout
      @default_log_level = Logger::INFO
      @logger = Logger.new(@stdout)
    end

    def msg(message, level = default_log_level)
      prepared_msg = message.is_a?(String) ? message : message.inspect

      logger.log(level, prepared_msg)
    end

    def error_msg(message)
      msg(message, Logger::ERROR)
    end

    def info_msg(message)
      msg(message)
    end
  end
end
