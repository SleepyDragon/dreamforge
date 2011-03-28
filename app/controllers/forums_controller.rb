class ForumsController < ApplicationController
  
  def index
    @categories = Category.all
  end
  
end
