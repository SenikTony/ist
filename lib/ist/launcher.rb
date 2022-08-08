# frozen_string_literal: true

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
      # prepare and check file by config
      # raise error if bad file
      # some another action (write loge, generate other errors, etc.)
      puts "Launch!!!"
    end
  end
end
