class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :destroy, :update, :edit]
    
    def index
        @posts = Post.all
    end
    
    def new 
        @post = Post.new
    end
    
    def create 
        @post = current_user.posts.new(post_params)
        if @post.save
            redirect_to @post, notice: 'your post has been created'
        else 
            render :new
        end
    end
    
    def edit
    end
    
    def update
        if @post.update(post_params)
            redirect_to @post, notice: 'The post has been updated'
        else
            redirect_to edit_post_path(@post), notice: 'Unable to update post'
        end
    end
    
    def show 
    end
    
    def destroy
        if @post.delete
            redirect_to posts_path, notice: 'The post has been deleted'
        else
            redirect_to pos_path, notice: 'Unable to delete post'
        end
    end
    
    private
    
    def post_params
        params.require(:post).permit(:date, :rationale)
    end
    
    def set_post
        @post=Post.find(params[:id])
    end
end
