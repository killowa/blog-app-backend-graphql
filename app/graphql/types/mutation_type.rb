module Types
  class MutationType < Types::BaseObject
    field :authenticate_user, null: false, mutation: Mutations::AuthenticateUser
    field :create_user, null: false, mutation: Mutations::CreateUser
  end
end
