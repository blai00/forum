class PostsController < ApplicationController
    before_action :set_posts, only: [:show]
    
    def index
        @posts = Post.all.order("created_at DESC")
    end
    
    def new
        @post = current_user.posts.build
    end 
    
    def create 
        @post = current.user.posts.build(posts_params)
        
        if @post.save
            redirect_to @post
        else
            render 'new'
        end
    end
    
    def show
    end
    
    
    private
    def posts_params
        params.require(:post).permit(:title, :content)
    end
    
    def set_posts
        @post = Post.find(params[:id])
    end
    
end
