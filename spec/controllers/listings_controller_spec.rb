require 'spec_helper'

describe ListingsController do
  describe '#index' do
    let(:listings) { double(:listings) }

    before do
      allow(Listing).to receive(:all) { listings }

      get :index
    end

    it 'is ok' do
      expect(response.status).to eq(200)
    end

    it 'assigns all listings' do
      expect(assigns(:listings)).to eq(listings)
    end
  end

  describe '#show' do
    let(:listing) { double(:listing) }
    let(:listing_id) { '3' }


    it 'assigns the listing' do
      allow(Listing).to receive(:find).with(listing_id) { listing }

      get :show, id: listing_id

      expect(assigns(:listing)).to eq(listing)
    end
  end
end
