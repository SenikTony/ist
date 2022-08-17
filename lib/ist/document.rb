# frozen_string_literal: true

require "marcel"

module Ist
  # Class for prepare and work with document contains links
  class Document
    # Class for store validation errors
    class Errors
      # Class represent error object
      class Error
        attr_accessor :attr_key, :message

        def initialize(attr_key, message)
          @attr_key = attr_key
          @message = message
        end

        def inspect
          "#{attr_key.to_s.capitalize} #{message}"
        end
      end

      attr_reader :error_list

      def initialize
        @error_list = []
      end

      def blank?
        error_list.compact.empty?
      end

      def clear
        @error_list.clear
      end

      def add(attr, message)
        @error_list << Error.new(attr, message)
      end

      def full_messages
        return "" if blank?

        @error_list.map(&:inspect).join("; ")
      end
    end

    # Class for document-file validations
    class Validator
      def self.call(*args)
        new(*args).call
      end

      def initialize(document)
        @document = document
      end

      def call
        validate_exist
        validate_size
        validate_type
      end

      private

      attr_reader :document

      def validate_exist
        return if File.exist?(document.file)

        document.errors.add(:file, "not exists")
      end

      def validate_size
        return unless File.zero?(document.file)

        document.errors.add(:size, "is zero")
      end

      def validate_type
        return if File.exist?(document.file) && document.text_file?

        document.errors.add(:file_type, "is not recognized. For work need text file.")
      end
    end

    MIME_TYPES = ["text/plain"].freeze

    attr_reader :file, :errors

    def initialize(file, logger)
      @file = file
      @logger = logger
      @errors = Errors.new
    end

    def text_file?
      MIME_TYPES.include?(Marcel::MimeType.for(name: file))
    end

    def valid?
      @errors.clear
      Validator.call(self)
      errors.blank? ? true : false
    end

    private

    attr_reader :logger
  end
end
