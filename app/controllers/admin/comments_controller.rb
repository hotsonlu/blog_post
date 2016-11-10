class Admin::CommentsController < Admin::BaseController
  layout 'layouts/admin'
  skip_before_action :authenticate

  skip_before_action do
    @post = Post.find( params[:post_id] )
  end

  def index
    @comments = @post.comments.order 
  end

  def destroy
    comment = @post.comments.find(params[:id])
    if comment.destroy
      flash[:notice] = '删除评论成功'
      redirect_to admin_post_comments_path(@post)
    else
      flash[:alert] = '删除失败'
      redirect_to admin_post_comments_path(@post)
    end
  end

end
