class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[ show edit update ]
  def index
    @users = User.all
  end

  def show

  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to show_user_path(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:full_name, :email, :phone, :address, :talk, :relation, :netflix, :games, :adventure, :job)
  end

  

end
