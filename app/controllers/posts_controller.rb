class PostsController < ApplicationController

  before_filter :authenticate_user!

  def create
    
    @post = current_user.posts.build(params[:post])
    
    if @post.save
      flash[:success] = t('post.create.flash.success')
    else
      flash[:error] = t('post.create.flash.error')
    end
    
    redirect_to :controller => :topics, :action => :show, :id => @post.topic
    
  end

end
