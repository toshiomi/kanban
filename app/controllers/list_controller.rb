class ListController < ApplicationController

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path
    else
      render new_list_path
    end
  end

  def edit
    @list = List.find_by(id: params[:id])
  end

  def update
    @list = List.find_by(id: params[:id])
    if @list.update_attributes(list_params)
      redirect_to root_path
    else
      render 
    end
  end

  private
  def list_params
    params.require(:list).permit(:title).merge(user: current_user)
  end
end
