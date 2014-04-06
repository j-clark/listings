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

    before do
      allow(Listing).to receive(:find).with(listing_id) { listing }

      get :show, id: listing_id
    end

    it 'assigns the listing' do
      expect(assigns(:listing)).to eq(listing)
    end
  end

  describe '#new' do
    it 'is successful' do
      get :new

      expect(response.status).to eq(200)
    end
  end

  describe '#create' do
    let(:new_listing) { double(:listing) }
    let(:create_params) do
      {
        listing: {
          description: 'description'
        }.with_indifferent_access
      }
    end

    before do
      allow(Listing).to receive(:create) { new_listing }

      post :create, create_params
    end

    it 'creates a new listing' do
      expect(Listing).to have_received(:create).with(create_params[:listing])
    end

    it 'redirects to the newly saved listing' do
      expect(response).to redirect_to(listing_path(new_listing))
    end
  end

  describe '#edit' do
    let(:listing) { double(:listing) }
    let(:listing_id) { '3' }

    before do
      allow(Listing).to receive(:find).with(listing_id) { listing }

      get :edit, id: listing_id
    end

    it 'assigns the listing' do
      expect(assigns(:listing)).to eq(listing)
    end
  end

  describe '#update' do
    let(:listing) { double(:listing, update: true) }
    let(:listing_id) { '3' }
    let(:update_params) do
      {
        listing: { description: 'description' }.with_indifferent_access,
        id: listing_id
      }
    end

    before do
      allow(Listing).to receive(:find).with(listing_id) { listing }

      patch :update, update_params
    end

    it 'assigns the listing' do
      expect(listing).to have_received(:update).with(update_params[:listing])
    end

    it 'redirects to the listing' do
      expect(response).to redirect_to(listing_path(listing))
    end
  end

  describe '#destroy' do
    let(:listing) { double(:listing) }
    let(:listing_id) { '7' }

    before do
      allow(Listing).to receive(:find).with(listing_id) { listing }
      allow(listing).to receive(:destroy)

      delete :destroy, id: listing_id
    end

    it 'destroys the listing' do
      expect(listing).to have_received(:destroy)
    end

    it 'redirects to the index page' do
      expect(response).to redirect_to(listings_path)
    end
  end
end
