class FavoritesController < ApplicationController
  before_action :set_room,  only: [:create, :destroy]
  before_action :set_post,  only: [:create, :destroy]
  include Zipline

  def index
    @page_title = "Favorite"
    @favorites = current_user.favorites.includes(:post).order("created_at DESC")
  end

  def create
    @media_index = params[:index].to_i
    @media_type = params[:media_type]
    favorite = current_user.favorites.new(post_id: params[:id], room_id: params[:room_id], media_id: @media_index, media_type: @media_type)
    if favorite.save
      if @media_type == "image"
        redirect_to show_image_room_post_path(@room.id, @post.id, params[:index])
      else
        redirect_to show_video_room_post_path(@room.id, @post.id, params[:index])
      end
    end
  end

  def destroy
    @image_index = params[:index].to_i
    @media_type = params[:media_type]
    favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:id], room_id: params[:room_id], media_id: @image_index, media_type: params[:media_type])
    if favorite.destroy
      if @media_type == "image"
        redirect_to show_image_room_post_path(@room.id, @post.id, params[:index])
      else
        redirect_to show_video_room_post_path(@room.id, @post.id, params[:index])
      end
    end
  end

  def download_all
    favorites = current_user.favorites

    respond_to do |format|
      format.zip do
        files = favorites.map do |favorite| 
          if favorite.media_type == "image"
            [favorite.post.images[favorite.media_id], "#{favorite.id}.jpg"]
          else
            [favorite.post.videos[favorite.media_id], "#{favorite.id}.mp4"]
          end
        end
        zipline(files, 'favorites.zip', auto_rename_duplicate_filenames: true)
      end
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
