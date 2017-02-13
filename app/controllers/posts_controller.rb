class PostsController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_post, only:[:show]

	def index
		@posts = Post.all
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			redirect_to posts_path, notice:"Post succesfully added!"
		else
			render 'new'
		end
	end

	def show
	end


	private
		def post_params
			params.require(:post).permit(:caption, :image, :remote_image_url)
		end

		def set_post
			@post = Post.find(params[:id])
		end
end
