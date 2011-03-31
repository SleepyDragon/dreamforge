class ForumsController < ApplicationController
  
  def index
    @categories = Category.all
  end
  
  def show
    @category = Forum.find(params[:id])
  end
  
end
