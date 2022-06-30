# frozen_string_literal: true

module Api
  module V1
    class RepliesController < ApplicationController
      before_action :authenticate_user!
      before_action :find_comment, only: [:create]

      def create
        if @comment.present?
          reply = Comment.new(reply_params.merge(user: current_user, post: @post, parent: @comment))
          if reply.save
            render json: reply, status: :created
          else
            render json: reply.errors.full_messages, status: :unprocessable_entity
          end
        else
          render json: 'Comment not found', status: :unprocessable_entity
        end
      end

      private

      def reply_params
        params.require(:reply).permit(:body)
      end

      def find_comment
        @post = Post.find(params[:post_id])
        @comment = begin
          @post.comments.find(params[:comment_id])
        rescue StandardError
          nil
        end
      end
    end
  end
end
