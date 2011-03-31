class ForumsController < ApplicationController
  
  def index
    @categories = Category.all
  end
  
  def show
    @forum = Forum.find(params[:id])
  end
  
end
