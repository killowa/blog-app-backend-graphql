# frozen_string_literal: true

# Parent controller whom all controllers iherit from also it's where Authorization logic exists
class ApplicationController < ActionController::API
    # before_action :authenticate_request, except: [:login]
  
    def current_user
      @current_user ||= authenticated_current
    end
  
    private
  
    def authenticate_request
      @current_user = authenticated_current
      render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_user
      @current_user
    end
  
    def authenticated_current
      AuthenticateApiRequestService.new(http_auth_header).call
    end
  
  
    def http_auth_header
      request.headers['Authorization']&.split(' ')&.last
    end
  
  end
  