# frozen_string_literal: true
require 'tempfile'

class DatasetJsonReloader
  def initialize(dataset)
    @dataset = dataset
  end

  def reload!
    return if json_unchanged?

    file = DatasetJsonBuilder.new(@dataset).call
    
    @dataset.json.attach(
      io: file,
      filename: "#{@dataset.id}_page_data.json",
      content_type: "application/json"
    )
  end

  private

  def json_unchanged?
    ThatsiteSchema.execute(@dataset.query).to_json == current_json
  end

  def current_json
    @dataset.json_attachment&.open{|file| file.read.force_encoding("UTF-8")}
  end
end
