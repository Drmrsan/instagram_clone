class PostsController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_post, only:[:show, :upvote, :downvote, :edit, :update, :destroy]

	def index
		if params[:tag]
    	@posts = Post.tagged_with(params[:tag])
  	else
			@posts = Post.all.order("created_at DESC")
		end
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

	def edit
	end

	def update
		if @post.update(post_params)
			flash[:notice] = "Post updated!"
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def destroy
		@post.delete
		redirect_to root_path
	end

	def upvote
		@post.upvote_by current_user
		respond_to do |format|
			format.html { redirect_to :back }
			format.js
		end
	end

	def downvote
		@post.downvote_by current_user
		respond_to do |format|
			format.html { redirect_to :back }
			format.js
		end
	end

	private
		def post_params
			params.require(:post).permit(:caption, :image, :remote_image_url, :all_tags)
		end

		def set_post
			@post = Post.find(params[:id])
		end
end
