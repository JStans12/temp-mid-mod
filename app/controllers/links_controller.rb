class LinksController < ApplicationController
  def index
    redirect_to login_path unless current_user
    @hot_links = Link.hot
  end
end
