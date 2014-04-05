require 'spec_helper'

feature 'Listings' do
  background { FactoryGirl.create(:listing, description: 'hamburgers for sale') }

  scenario 'viewing all listings' do
    visit('/listings')

    expect(page.text).to have_text('hamburgers for sale')
  end
end
