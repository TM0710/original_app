class FavoritesController < ApplicationController
  before_action :set_room,  only: [:create, :destroy]
  before_action :set_post,  only: [:create, :destroy]

  def index
    @page_title = "Favorite"
    @favorites = current_user.favorites.includes(:post).order("created_at DESC")
  end

  def create
    @image_index = params[:index].to_i
    favorite = current_user.favorites.new(post_id: params[:id], room_id: params[:room_id], image_id: @image_index)
    if favorite.save
      redirect_to show_image_room_post_path(@room.id, @post.id, params[:index])
    end
  end

  def destroy
    @image_index = params[:index].to_i
    favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:id], room_id: params[:room_id], image_id: @image_index)
    if favorite.destroy
      redirect_to show_image_room_post_path(@room.id, @post.id, index: params[:index])
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_post
    @post = @room.posts.find(params[:id])
  end
end
