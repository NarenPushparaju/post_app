class Api::V1::UsersController < ApplicationController
  before_action :http_authenticate

  def index
    if @set == 1
      render json: @user.as_json(only: [:email,:id])
    else
      render json: {errors: "Unauthorized Access"}
    end
  end

end

def http_authenticate
  authenticate_or_request_with_http_basic do |username, password|
    @user = User.find_by_email(username)
    if @user.valid_password?(password)
      @set = 1
    else
      @set = 0
    end
  end
end