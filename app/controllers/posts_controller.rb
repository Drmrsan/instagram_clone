class PostsController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_post, only:[:show, :upvote]

	def index
		@posts = Post.all.order("created_at DESC")
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Post succesfully added!"
			redirect_to posts_path
		else
			render 'new'
		end
	end

	def show
	end

	def upvote
		@post.liked_by current_user
		redirect_to :back
	end

	private
		def post_params
			params.require(:post).permit(:caption, :image, :remote_image_url)
		end

		def set_post
			@post = Post.find(params[:id])
		end
end
