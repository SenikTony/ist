# frozen_string_literal: true

require "optparse"
require "ist/configuration"
require "ist/launcher"

module Ist
  # Class for command line interface
  class CLI
    attr_reader :argv, :config_options, :config

    def self.call(argv)
      new(argv).call
    end

    def initialize(argv)
      @argv = argv.dup
      @config_options = {}
      @config = nil
    end

    def call
      raise(ArgumentError, "wrong number of arguments (given 0, expected 1)") if argv == []

      build_config
      Ist::Launcher.call(config: config)
    end

    private

    def parser
      OptionParser.new do |opts|
        opts.on("-dNAME", "--dir=NAME", "Directory for scraped files") do |dirname|
          config_options[:dir_name] = dirname
        end
      end
    end

    def build_config
      file = argv.shift
      parser.parse!(argv)
      @config = Ist::Configuration.new(file, config_options)
    end
  end
end
