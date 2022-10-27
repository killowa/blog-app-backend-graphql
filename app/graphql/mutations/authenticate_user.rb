module Mutations
    class AuthenticateUser < BaseMutation
        argument :email, String
        argument :password, String
        field :user, Types::UserType
        field :token, String
        field :errors, [String]

        def resolve(email:, password:)
            user = User.find_by(email: email)

            if user&.authenticate(password)
                { user: user, token: user.auth_token, errors: [] }
            else
                { errors: ['Unauthorized']}
            end
        end
    end
end