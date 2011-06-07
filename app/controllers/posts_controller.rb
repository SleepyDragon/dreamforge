class PostsController < ApplicationController

  def create
    
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = t("Thank you for your post.")
    else
      flash[:error] = t("There was an error.")
    end
    
    redirect_to :controller => :topics, :action => :show, :id => @post.topic
    
  end

end
