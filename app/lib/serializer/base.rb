# frozen_string_literal: true

module Serializer
  class Base < Blueprinter::Base
    SHOULD_INCLUDE_LAMBDA = lambda { |field, _object, opts|
      should_include?(field, opts)
    }

    def self.field(field_name, options = {}, &block)
      options[:if] ||= SHOULD_INCLUDE_LAMBDA
      super
    end

    def self.association(association_name, options = {}, &block)
      options[:extractor] ||= Serializer::Extractor::AssociationExtractor
      options[:if] ||= SHOULD_INCLUDE_LAMBDA

      super
    end

    def self.should_include?(field_name, options)
      return false if options[:includes].blank?

      includes_option_sanitized(options).keys.include?(field_name)
    end

    def self.includes_option_sanitized(options)
      Utils::IncludesOptionSanitizer.new(options[:includes]).call
    end
  end
end
