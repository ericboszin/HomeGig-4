class BidsController < ApplicationController
  def index
    @bids = Bid.all
  end

  def show
    @bid = Bid.find(params[:id])
  end

  def edit
    @bid = Bid.find(params[:id])
  end

  def new
    @bid = Bid.new
  end

  def create
    status = '0'
    @bid = Bid.new(bid_params)

    if @bid.save
      redirect_to @bid
    else
      flash[:warning] = "Error: Could not create Bid"
      render 'new'
    end
  end

  def update
    @bid = Bid.find(params[:id])

    if @bid.update(bid_params)
      redirect_to @bid
    else
      render 'edit'
    end
  end

  def destroy
    @bid = Bid.find(params[:id])
    @bid.destroy

    redirect_to bids_path
  end

  private
    def bid_params
      params.require(:bid).permit(:description, :job, :amount)
    end
end
