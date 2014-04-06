class ListingsController < ApplicationController
  before_filter :fetch_listing, only: [:show, :edit, :update]

  def index
    @listings = Listing.all
  end

  def show; end

  def new

  end

  def create
    listing = Listing.create(listing_params)

    redirect_to(listing_path(listing))
  end

  def edit; end

  def update
    listing.update(listing_params)

    redirect_to listing_path(listing)
  end

  private

  def fetch_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:description)
  end

  attr_accessor :listing
end
