# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApplicationController
      before_action :authenticate_user!
      before_action :find_post, only: %i[show update destroy]

      def index
        render json: process_posts, status: :ok
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
          render json: @post.errors.full_messages, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/posts/1
      def update
        if @post.update(post_params)
          render json: @post
        else
          render json: @post.errors.full_messages, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/posts/1
      def destroy
        if @post.destroy
          head :no_content
        else
          render json: @post.errors.full_messages, status: :unprocessable_entity
        end
      end

      private

      def find_post
        @post = Post.find(params[:id])
      end

      def process_posts
        posts = Post.all
        posts = posts.where(user_id: params[:user_id]) if params[:user_id].present?
        if sort_by
          posts = posts.select('posts.*, count(comments.id) as comment_count').joins(:comments).group('posts.id').order("comment_count #{sort_by}")
        end
        posts
      end

      def sort_by
        params[:sort_by].blank? ? nil : params[:sort_by]
      end

      def post_params
        params.require(:post).permit(:title, :content)
      end
    end
  end
end
