module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :user, Types::UserType, null:false do
      argument :id, ID, required: false
    end

    field :posts, [Types::PostType], null: false

    def user(id:)
      User.find(id)
    end

    def posts
      post = PostPolicy::Scope.new(context[:current_user], Post).resolve
    end
  end
end
