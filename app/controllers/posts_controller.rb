class PostsController < ApplicationController
  before_action :set_room, only: [:index, :new, :create, :show_image, :show_video, :destroy_image, :destroy_video]
  before_action :set_post, only: [:show_image, :show_video, :destroy_image, :destroy_video]
  before_action :set_image, only: [:show_image, :destroy_image]
  before_action :set_video, only: [:show_video, :destroy_video]
  before_action :authenticate_user!
  def index
    @posts = @room.posts.includes(:user).order('created_at DESC')
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

  def show_image
    @image_index = params[:index].to_i
    @image = @post.images[@image_index]
  end

  def show_video
    @video_index = params[:index].to_i
    @video = @post.videos[@video_index]
  end

  def destroy_image
    if @image
      favorite = current_user.favorites.find_by(post_id: @post.id, image_id: @image_index)
      favorite.destroy if favorite
      @image.purge
      
      @post.images.reload
      if @post.images.empty?
        @post.destroy
      end
    end
    redirect_to room_posts_path(@room)
  end

  def destroy_video
      @video.purge
      
      @post.videos.reload
      if @post.videos.empty?
        @post.destroy
      end
    redirect_to room_posts_path(@room)
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_post
    @post = @room.posts.find(params[:id])
  end

  def set_image
    @image_index = params[:index].to_i
    @image = @post.images[@image_index]
  end

  def set_video
    @video_index = params[:index].to_i
    @video = @post.videos[@video_index]
  end

  def post_params
    params.require(:post).permit(images: [], videos: []).merge(user_id: current_user.id)
  end
end
