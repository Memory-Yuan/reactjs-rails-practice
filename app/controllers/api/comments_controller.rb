class Api::CommentsController < ApplicationController
	before_action :set_comment, only: [:destroy]

	def index
		@comments = Comment.all
		render json: @comments
	end

	def create
		Comment.create!(create_params)
		@comments = Comment.all
		render json: @comments
	end

	def destroy
		@comment.destroy
		@comments = Comment.all
		render json: @comments
	end

	private
		def set_comment
      @comment = Comment.find(params[:id])
    end

		def create_params
			params.require(:comment).permit(:author, :text)
		end
end