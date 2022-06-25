# frozen_string_literal: true

module Types
  class SiteType < Types::BaseObject
    field :id, ID, null: false
    field :color_palette_id, Integer
    field :font_pair_id, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :name, String, null: false
    field :business, Types::BusinessType, null: false
    field :texts, GraphQL::Types::JSON, null: false do
      argument :names, [String]
    end

    def texts(names:)
      object.texts
            .where(name: names)
            .reduce(Hash.new){|memo, text_instance| 
              memo.merge!({text_instance.name => text_instance.content})
            }
    end
  end
end
