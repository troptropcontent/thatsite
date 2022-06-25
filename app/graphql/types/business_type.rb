# frozen_string_literal: true

module Types
  class BusinessType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :site_id, Integer
    field :offices, [Types::OfficeType], null: false
  end
end
