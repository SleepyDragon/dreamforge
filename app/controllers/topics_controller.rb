class TopicsController < ApplicationController

  def show
    
    @topic = Topic.find params[:id]
    @posts = @topic.posts
    
    if user_signed_in?
      @post = Post.new :user => current_user, :topic => @topic
    end
    
  end

end
