# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      before_action :authenticate_user!
      before_action :find_post, only: %i[index create]

      def index
        comments = @post.comments
        render json: comments
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

      private

      def find_post
        @post = Post.find(params[:post_id])
      end

      def comment_params
        params.require(:comment).permit(:body)
      end
    end
  end
end
