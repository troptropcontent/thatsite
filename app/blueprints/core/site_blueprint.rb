# frozen_string_literal: true

class Core::SiteBlueprint < Serializer::Base
  field :name
  association :business, blueprint: Activity::BusinessBlueprint
end
