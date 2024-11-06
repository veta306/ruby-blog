class PostCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @post_comment = @post.post_comments.build(post_comment_params)

    if @post_comment.save
      CommentsMailer.submitted(@post_comment).deliver_later
      redirect_to @post
    else
      render "posts/show", status: :unprocessable_entity
    end
  end

  private

    def set_post
      @post = Post.find(params[:post_id])
    end

    def post_comment_params
      params.require(:post_comment).permit(:content)
    end
end
