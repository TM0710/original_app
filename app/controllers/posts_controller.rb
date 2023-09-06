class PostsController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
  end

  def new
    @post = Post.new
  do
  
  def create
  end
end
