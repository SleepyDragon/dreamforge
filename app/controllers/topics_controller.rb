class TopicsController < ApplicationController

  def show
    
    @topic = Topic.find params[:id]
    @posts = @topic.posts
    
    @post = Post.new
    
    @post.topic = @topic if user_signed_in?
    
  end

end
