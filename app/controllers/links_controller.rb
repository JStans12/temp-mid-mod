class LinksController < ApplicationController
  def index
    redirect_to login_path unless current_user
    @links = current_user.links
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    link = Link.find(params[:id])
    link.assign_attributes(link_params)
    if link.save
      redirect_to root_path
    else
      redirect_to edit_link_path(link)
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
