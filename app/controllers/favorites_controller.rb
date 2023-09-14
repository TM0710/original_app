class FavoritesController < ApplicationController
  before_action :set_room,  only: [:create, :destroy]
  before_action :set_post,  only: [:create, :destroy]
  # before_action :set_image, only: [:create, :destroy]

  def index
    @favorites = current_user.favorites
  end

  def create
    @image_index = params[:index].to_i
    favorite = current_user.favorites.new(post_id: params[:id], image_id: params[:index])
    if favorite.save
    redirect_to show_image_room_post_path(@room.id, @post.id, params[:index])
    end
  end

  def destroy
    favorite = Favorite.find_by(post_id: @post.id, user_id: current_user.id, image_id: @image_id)
    favorite.destroy
    redirect_to show_image_room_post_path(@room.id, @post.id, index: params[:index])
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_post
    @post = @room.posts.find(params[:id])
  end

  # def set_image
  #   @image_index = params[:index].to_i
  #   @image = @post.images[@image_index]
  #   blob = @image.blob
  #   @image_id = blob.id
  # end
end
