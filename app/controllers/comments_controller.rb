class CommentsController < ApplicationController

	before_action :set_store, only: [:create, :destroy]

	def create
		@comment = @store.comments.build(comments_params)

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
		@comment = @store.comments(params[:id]).destroy
		redirect_to root_path
	end

	private

	def set_store
		@store = Store.find(params[:store_id])
	end	

	def comments_params
		params.requiere(:comment).permit(:text)
	end

end
