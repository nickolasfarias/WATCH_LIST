class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy, :othershow]
  skip_before_action :authenticate_user!, only: [:index, :othershow]

  def index
    @lists = List.where.not(user: current_user).order("RANDOM()")
  end

  def show
    @bookmark = Bookmark.new
    @review = Review.new(list: @list)
  end

  def othershow
    @bookmark = Bookmark.new
    @review = Review.new(list: @list)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  def my
    @lists = List.where(user: current_user)
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
