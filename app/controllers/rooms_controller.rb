class RoomsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    if user_signed_in?
      @page_title = "Home"
      @name = current_user.name
      @posts = current_user.posts.order('created_at DESC')
    else
    end
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      current_user.rooms << @room
      redirect_to room_posts_path(@room)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  def search
    @room = Room.find_by(room_path: params[:room_path])
    if @room
      if current_user.rooms.exists?(@room.id)
        redirect_to room_posts_path(@room)
      else
        current_user.rooms << @room
        redirect_to room_posts_path(@room)
      end
    else
      render :index, status: :unprocessable_entity
    end
  end

  def exit
    @room = Room.find(params[:id])
    if @room.users.destroy(current_user)
      favorites = Favorite.where(user_id: current_user.id).where(room_id: @room)
      favorites.destroy_all
      redirect_to root_path
    else
    redirect_to room_posts_path(@room)
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :room_path, :wedding_day).merge(host_id: current_user.id)
  end
end
