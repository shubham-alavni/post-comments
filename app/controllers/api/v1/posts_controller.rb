class Api::V1::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:show, :update, :destroy]

  def index
    if params[:user_id].present?
      user = User.find(params[:user_id])
      if params[:sort_by].present? 
        # Sort by number of comments
        posts = User.select("users.id, posts.*, COUNT(comments.id) max_comment").joins(:posts).joins('inner join comments on posts.id = comments.post_id').where("users.id = #{user.id}").group("users.id, posts.id").order("max_comment DESC")
      else
        posts = user.posts
      end
    else
      posts = Post.all
    end
    render json: posts, status: :ok
  end

  # GET /api/v1/posts/1
  def show
    render json: @post
  end

  # POST /api/v1/posts
  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/posts/1
  def destroy
    @post.destroy
  end
  
  # posts with max comments
  def posts_with_max_comments
    posts = Post.select("posts.*, COUNT(comments.id) comment_count").joins(:comments).group("posts.id").order("comment_count DESC")
    render json: posts, status: :ok    
  end

  private
  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
