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
end
