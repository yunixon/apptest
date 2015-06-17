class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @upload = Upload.new(user: current_user)
    @uploads = @user.uploads
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user, notice: 'Successfully updated'
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
