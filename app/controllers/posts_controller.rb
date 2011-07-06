class PostsController < ApplicationController

  before_filter :authenticate_user!
  
  def create
    
    @post = current_user.posts.build(params[:post])
    
    if @post.save
      flash[:success] = t('post.create.flash.success')
      
      redirect_to :controller => :topics, :action => :show, :id => @post.topic
    else
      flash[:error] = t('post.create.flash.error')
      
      # Redirect to the login page
      redirect_to new_user_session_path
    end
    
  end

end
