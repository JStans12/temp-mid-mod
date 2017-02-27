class LinksController < ApplicationController
  def index
    redirect_to login_path unless current_user
    @links = Link.all
    @hot = Link.hot
    @hottest = Link.hottest
  end
end
