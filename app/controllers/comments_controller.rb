class CommentsController < ApplicationController

	before_action :set_liquorstore, only: [:create, :destroy]

	def create
		@comment = @liquorstore.comments.build(comments_params)

		respond_to do |format| 
			if @comment.save
				format.html{redirect_to root_path, notice: "Comentario creado con éxito" }
				format.js
			else
				format.html{redirect_to root_path, notice: "error!!!" }
				format.js
			end
	end

	def destroy
		@comment = @liquorstore.comments(params[:id]).destroy
		redirect_to root_path
	end

	private

	def set_liquorstore
		@liquorstore = Liquorstore.find(params[:liquorstore_id])
	end	

	def comments_params
		params.requiere(:comment).permit(:content, :liquorstore_id, :user_id, :id)
	end

end
