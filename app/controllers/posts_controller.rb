class PostsController < ApplicationController
  before_action :set_room, only: [:index, :new, :create, :show,:destroy]
  before_action :set_post, only: [:show,:destroy]
  before_action :authenticate_user!
  def index
    @posts = @room.posts.includes(:user).order("created_at DESC")
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = @room.posts.new(post_params)
    if @post.save
      redirect_to room_posts_path(@room)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    @post.destroy
    redirect_to room_posts_path(@room)
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_post
    @post = @room.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:image).merge(user_id: current_user.id)
  end
end
