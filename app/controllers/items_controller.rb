class ItemsController < ApplicationController

  before_filter :check_if_admin, only: [:new,:edit,:update]
  before_filter :find_item, only: [:show,:edit,:update,:destroy,:upvote]

  def index
    @items = Item.all
    @items = Item.paginate(:page => params[:page], :per_page => 2)
  end

  #/items/1 GET
  def show
    unless @item
      render text: "Page not found",status:404
    end
  end

  #/items/new GET
  def edit
  end

  #/items/1 PUT
  def update
    @item.update_attributes(item_params)
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render "edit"
    end
  end

  #/items/1/edit GET
  def new
    @item = Item.new
  end

  # /items POST
  def create
    @item = Item.create(item_params)
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render "new"
    end
  end

  # /items/1 DELETE
  def destroy
    @item.destroy
    redirect_to action: :index
  end

  def upvote
    @item.increment!(:votes_count)
    redirect_to action: :index
  end

  private
  def find_item
    @item = Item.where(id: params[:id]).first
    render_404 unless @item
  end

  def item_params
    params.require(:item).permit!
  end
end
