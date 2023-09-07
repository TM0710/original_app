class PostsController < ApplicationController
  before_action :set_room, only: [:index, :new, :create]

  def index
    @posts = @room.posts.includes(:user)
  end

  def new
    @post = Post.new
  end
  
  def create
    binding.pry
    @post = @room.posts.new(post_params)
    if @post.save
      redirect_to room_posts_path(@room)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def post_params
    params.require(:post).permit(:image).merge(user_id: current_user.id)
  end
end
