# frozen_string_literal: true

module Types
  class BusinessHourType < Types::BaseObject
    field :id, ID, null: false
    field :office_id, Integer, null: false
    field :weekday, String, null: false
    field :opens_at, GraphQL::Types::ISO8601DateTime, null: false
    field :closes_at, GraphQL::Types::ISO8601DateTime, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
