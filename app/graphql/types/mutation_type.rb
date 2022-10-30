module Types
  class MutationType < Types::BaseObject
    field :authenticate_user, null: false, mutation: Mutations::AuthenticateUser
    field :create_user, null: false, mutation: Mutations::CreateUser
    field :create_post, null: false, mutation: Mutations::CreatePost
    field :edit_post, null: false, mutation: Mutations::EditPost
  end
end
