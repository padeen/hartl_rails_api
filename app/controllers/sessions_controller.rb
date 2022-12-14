class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      render json: @user
    else
      render status: :unauthorized
    end
  end

  def destroy
  end
end
