# frozen_string_literal: true

class Activity::OfficeBlueprint < Serializer::Base
  field  :id
  field  :address_city
  field  :address_complement
  field  :address_country
  field  :address_full
  field  :address_zipcode
  field  :name
  field  :phone
end
