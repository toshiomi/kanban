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

  private
  def list_params
    params.require(:list).permit(:title).merge(user: current_user)
  end
end
