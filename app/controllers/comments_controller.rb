class CommentsController < ApplicationController

  before_action :require_sign_in
  before_action :authorize_user, only: [:destroy]

  def create
    id = params[:post_id] || params[:topic_id]
    if id == params[:post_id]
      @post = Post.find(id)
      comment = @post.comments.new(comment_params)
      comment.user = current_user

      if comment.save
        flash[:notice] = "Comment saved successfully."
        redirect_to [@post.topic, @post]
      else
        flash[:alert] = "Comment failed to save."
        redirect_to [@post.topic, @post]
      end
    elsif id == params[:topic_id]
      @topic = Topic.find(id)
      comment = @topic.comments.new(comment_params)
      comment.user = current_user

      if comment.save
        flash[:notice] = "Comment saved successfully."
        redirect_to @topic
      else
        flash[:alert] = "Comment failed to save."
        redirect_to @topic
      end
    end
  end

  def destroy
    id = params[:post_id] || params[:topic_id]
    if id == params[:post_id]
    @post = Post.find(id)
    comment = @post.comments.find(id)

    if comment.destroy
      flash[:notice] = "Comment was deleted."
      redirect_to [@post.topic, @post]
    else
      flash[:alert] = "Comment couldn't be deleted. Try again."
      redirect_to [@post.topic, @post]
    end

    elsif params[:topic_id]
      @topic = Topic.find(id)
      comment = @topic.comments.find(id)

      if comment.destroy
        flash[:notice] = "Comment was deleted."
        redirect_to @topic
      else
        flash[:alert] = "Comment couldn't be deleted. Try again."
        redirect_to @topic
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_user
     comment = Comment.find(params[:id])
     unless current_user == comment.user || current_user.admin?
       flash[:alert] = "You do not have permission to delete a comment."
       redirect_to [comment.post.topic, comment.post]
     end
   end
end
