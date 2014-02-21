class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_testimonial, only: [:index, :show]

  def index
    if params[:q]
      @users = User.where("email LIKE :q OR first_name LIKE :q OR last_name LIKE :q", q: "%#{params[:q]}%")
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
    @web_link_names = WebLink::SITES.reject { |s| s == "Schedule" }
  end

  def edit
    @user = User.find(params[:id])
    @web_link = WebLink.new
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private 
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :bio, :avatar)
    end

    def set_testimonial
      @testimonial = Testimonial.new      
    end
end
