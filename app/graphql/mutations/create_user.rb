module Mutations
    class CreateUser < BaseMutation
        argument :email, String, required: true
        argument :password, String, required: true
        argument :password_confirmation, String, required: true
        argument :username, String, required: true
        argument :role, String, required: true
        field :user, Types::UserType
        field :errors, [String]

        def resolve(email:, password:, password_confirmation:, username:, role:)
            user = User.new(
                    email: email,
                    password: password,
                    password_confirmation: password_confirmation, 
                    username: username,
                    role: role
                   )

            if user.save
                { user: user, errors: [] }
            else
                { user: {}, errors: ['Invalid input']}
            end
        end

    end
end