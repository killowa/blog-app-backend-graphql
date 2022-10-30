# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :body, String
    field :user_id, Integer, null: false
    field :user, UserType
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def current_user
      context[:current_user]
    end

    def self.authorized?(object, context)

      super && authorize :post, :update?
    end
  end
end
