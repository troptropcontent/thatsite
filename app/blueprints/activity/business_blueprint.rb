# frozen_string_literal: true

class Activity::BusinessBlueprint < Serializer::Base
  field :name
  association :offices, blueprint: Activity::OfficeBlueprint
end
