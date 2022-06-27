# frozen_string_literal: true
require 'tempfile'

class DatasetJsonBuilder
  def initialize(dataset)
    @dataset = dataset
  end

  def call
    file = Tempfile.new('page_data', encoding: 'UTF-8') 
    file.write(json)
    file.rewind
    file
  end

  private

  def json
    ThatsiteSchema.execute(@dataset.query).to_json
  end
end
