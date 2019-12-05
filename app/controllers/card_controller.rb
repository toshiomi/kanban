class CardController < ApplicationController
  before_action :set_card, only:[:show, :edit, :update, :destroy]
  
  def new
    @card = Card.new
    @list = List.find_by(id: params[:list_id])
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to root_path
    else
      render new_list_card_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to root_path
    else
      render edit_list_card_path
    end
  end

  def destroy
    if @card.destroy
      redirect_to root_path
    else
    end
  end

  private
  def card_params
    params.require(:card).permit(:title, :memo, :list_id)
  end

  def set_card
    @card = Card.find_by(id: params[:id])
  end
end
