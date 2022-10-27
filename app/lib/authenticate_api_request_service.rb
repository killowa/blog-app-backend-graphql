# frozen_string_literal: true

# Authentication class
class AuthenticateApiRequestService
    def initialize(token)
      @token = token
    end
  
    def call
      return unless decoded_auth_token
  
      user
    end
  
    private
  
    attr_reader :token
  
    def user
      @user = User.find(decoded_auth_token[:user_id])
    end
  
    def decoded_auth_token
      @decoded_auth_token ||= JsonWebToken.decode(token)
    end
  end
  