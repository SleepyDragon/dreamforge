class ForumsController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @forum = Forum.find(params[:id])
    # @topics = @forum.topics.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 10
    @topics = @forum.topics
  end
end
