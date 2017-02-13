class CommentsController < ApplicationController
	before_action :find_post, only:[:create, :delete]
	def create
		@comment = @post.comments.build(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to :back
		else
			render :back
		end
	end

	private
		def find_post
			@post = Post.find(params[:post_id])
		end

		def comment_params
			params.require(:comment).permit(:content)
		end
end