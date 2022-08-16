# frozen_string_literal: true

class Serializer::Utils::IncludesOptionSanitizer
  def initialize(includes_option)
    @includes_option = includes_option
    @result = {}
  end

  def call
    @includes_option = [@includes_option] unless @includes_option.is_a?(Array)
    @result = transform_array_to_hash!(@includes_option)
  end

  private

  def transform_array_to_hash!(array)
    array.each_with_object({}) do |item, memo|
      case item
      when String, Symbol
        memo[item.to_sym] = nil
      when Array
        memo.merge!(transform_array_to_hash!(item))
      when Hash, ActionController::Parameters
        memo.merge!(item.transform_keys(&:to_sym))
      end
    end
  end
end
