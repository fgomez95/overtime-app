class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :destroy, :update, :edit]

    def index
        @posts = Post.user_posts(current_user)
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
        authorize @post
    end
    
    def update
        authorize @post
        if @post.update(post_params)
            redirect_to @post, notice: 'The post has been updated'
        else
            redirect_to edit_post_path(@post), notice: 'Unable to update post'
        end
    end
    
    def show 
        authorize @post
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
        params.require(:post).permit(
            :date, 
            :rationale, 
            :status,
            :overtime_request
            )
    end
    
    def set_post
        @post=Post.find(params[:id])
    end

end
