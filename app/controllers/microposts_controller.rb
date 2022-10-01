class MicropostsController < ApplicationController
  before_action :set_user, only: [ :create, :destroy ]

  def show
  end

  def create
    @micropost = @user.microposts.build(micropost_params)

    if @micropost.save
      render json: @micropost, status: :created, location: @micropost
    else
      render json: @micropost.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @micropost = @user.microposts.find(params[:id])

    @micropost.destroy
  end

  private
    def set_user
      @user = User.find(1)
    end

    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
