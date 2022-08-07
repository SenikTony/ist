# frozen_string_literal: true

module Ist
  # Class for command line interface
  class CLI
    attr_reader :argv

    def self.call(argv)
      new(argv).call
    end

    def initialize(argv)
      @argv = argv
    end

    def call
      puts argv.to_s
    end
  end
end
