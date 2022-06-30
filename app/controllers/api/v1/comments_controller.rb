class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:index, :create]

  def index
    comments = @post.comments
    render json: comments
  end

  def most_commented_users
    comments = User.select("users.id as user_id, COUNT(comments.id) comment_count").joins(:comments).group("users.id").order("comment_count DESC").as_json(:except => :id)
    render json: comments, status: :ok
  end

  def create
    comment = @post.comments.new(comment_params)
    comment.user = current_user
    if comment.save
      render json: comment, status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  # User should be able to reply over comment
  def reply_to_comment
    comment = Comment.find(params[:comment_id])
    reply = Comment.new(body: reply_params[:body], user_id: current_user.id, post_id: comment.post_id, reply_id: comment.id)
    if reply.save
      render json: {message: "Replied on comment"}, status: :created
    else
      render json: reply.errors, status: :unprocessable_entity  
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def reply_params
    params.require(:reply).permit(:body)
  end
end