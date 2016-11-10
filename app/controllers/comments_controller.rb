class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def index
    @post = Post.find(params[:post_id])
    res = @post.comments.collect { |comment| build_json(comment) }
  render :json => res
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter,:email, :body)
    end


  def build_json(comment)
    {
      body: comment.body,
      commenter: comment.commenter,
      'created_at' => format_time(comment.created_at)
    }
  end
end
