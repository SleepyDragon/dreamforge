class TopicsController < ApplicationController

  def show
    
    @topic = Topic.find params[:id]
    @posts = @topic.posts
    
  end

end
