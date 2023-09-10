class FavoritesController < ApplicationController

  def index
    @favorites = current_user.favorites
  end

  def create
    favorite = current_user.favorites.build(post_id: params[:post_id] )
    favorite.save
    redirect_to room_post_path(id: params[:post_id], room_id: params[:room_id])
  end

  def destroy
    favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
    favorite.destroy
    redirect_to room_post_path(id: params[:post_id], room_id: params[:room_id])
  end
end
