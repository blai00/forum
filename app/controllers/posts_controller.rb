class PostsController < ApplicationController
    before_action :set_posts, only: [:show]
    
    def index
    end
    
    def new
        @post = Post.new
    end 
    
    def create 
        @post = Post.new(posts_params)
        
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
