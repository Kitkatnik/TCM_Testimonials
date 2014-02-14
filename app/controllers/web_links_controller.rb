class WebLinksController < ApplicationController
  before_action :set_user, only: [:create, :destroy]

  def update

  end
  
  def create
    web_link = @user.web_links.build(web_link_params)

    if web_link.save
      redirect_to edit_user_path(@user), notice: "Link Saved"
    else
      redirect_to edit_user_path(@user), alert: web_link.errors.full_messages.to_sentence
    end
  end

  def destroy
    web_link = @user.web_links.find params[:id]
    web_link.destroy
    redirect_to :back
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def web_link_params
    params.require(:web_link).permit(:title, :url)
  end

end
