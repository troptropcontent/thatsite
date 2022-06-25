# frozen_string_literal: true

module Types
  class OfficeType < Types::BaseObject
    field :id, ID, null: false
    field :business_id, Integer, null: false
    field :address_full, String, null: false
    field :address_complement, String
    field :address_zipcode, String, null: false
    field :addresse_city, String, null: false
    field :name, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :phone, String
    field :business_hours, [Types::BusinessHourType], null: false
  end
end
