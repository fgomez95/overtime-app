class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :delete, :update]
    
    def index
        @posts = Post.all
    end
    
    def new 
        @post = Post.new
    end
    
    def create 
        @post = Post.new(post_params)
        if @post.save
            redirect_to post_path(@post), notice: 'your post has been created'
        else 
            render :new
        end
    end
    
    def show 
    end
    
    private
    
    def post_params
        params.require(:post).permit(:date, :rationale)
    end
    
    def set_post
        @post=Post.find(params[:id])
    end
end
