# frozen_string_literal: true

require 'blueprinter'

class Serializer::Extractor::AssociationExtractor < Blueprinter::AssociationExtractor
  def extract(association_name, object, local_options, options = {})
    new_local_options = local_options.dup
    sanitized_includes = Serializer::Utils::IncludesOptionSanitizer.new(new_local_options[:includes]).call
    new_local_options[:includes] = sanitized_includes[association_name]

    super(association_name, object, new_local_options, options)
  end
end
