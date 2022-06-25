module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # Get a specific site
    field :site, Types::SiteType, null: false do
      argument :name, String, required: true
    end
    def site(name:)
      Site.find_by(name: name)
    end
  end
end
