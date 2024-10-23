class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)

    if @comment.save
      CommentsMailer.submitted(@comment).deliver_later
      redirect_to @post
    else
      render "posts/show", status: :unprocessable_entity
    end
  end

  private

    def set_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
