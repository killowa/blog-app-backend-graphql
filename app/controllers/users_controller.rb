class UsersController < ApplicationController
    def login
        user = User.find_by(email: params[:email])

        if user&.authenticate(params[:password])
            render { user: user, token: user.auth_token }, status: :ok
        else
            render { error: 'Unauthorized'}, status: :ok
        end
    end
end
