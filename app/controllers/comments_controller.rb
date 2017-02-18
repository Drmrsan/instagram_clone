class CommentsController < ApplicationController
	before_action :find_post, only:[:create, :destroy]
	before_action :find_comment, only:[:destroy]
	def create
		@comment = @post.comments.build(comment_params)
		@comment.user_id = current_user.id

		respond_to do |format|

			if @comment.save
				format.html { redirect_to root_path }
				format.js
			else
				format.html { redirect_to root_path }
				format.js
			end
		end
	end

	def destroy
		@comment.delete
		respond_to do |format|
			format.html { redirect_to root_path }
			format.js
		end
	end

	private
		def find_post
			@post = Post.find(params[:post_id])
		end

		def find_comment
			@comment = @post.comments.find(params[:id])
		end

		def comment_params
			params.require(:comment).permit(:content)
		end
end