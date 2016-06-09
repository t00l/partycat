class CommentsController < ApplicationController

	before_action :set_liquorstore, only: [:create, :destroy]

	def create
		@comment = @liquorstore.comments.build(comments_params)
		@comment.user_id = current_user.id if current_user
		@comment.save

		respond_to do |format|
			if @comment.save
				format.html{redirect_to @liquorstore, notice: "Comentario creado con éxito" }
				format.js
			else
				format.html{redirect_to root_path, notice: "error!!!" }
				format.js
			end
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
		params.require(:comment).permit(:id, :user_id, :content, :liquorstore_id )
	end

end
