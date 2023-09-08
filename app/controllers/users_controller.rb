class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    if current_user.id == params[:id].to_i
      @name = current_user.name
      @posts = current_user.posts.order('created_at DESC')
    else
      redirect_to root_path
    end
  end
end
