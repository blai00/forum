class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(params[:comment].permit(:content))
        @comment.user_id = current_user.id if current_user
        
        if @comment.save
            redirect_to post_path(@post)
        else
            render 'new'
        end
    end
end