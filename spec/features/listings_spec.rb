require 'spec_helper'

feature 'Listings' do
  given(:description_1) { 'hamburgers for sale' }
  given(:description_2) { 'hamburgers wanted' }

  background do
    FactoryGirl.create(:listing, description: description_1)
    FactoryGirl.create(:listing, description: description_2)

    visit('/listings')
  end

  scenario 'viewing all listings' do
    expect(page.text).to have_text(description_1)
  end

  scenario 'clicking a listing and viewing it on its own page' do
    click_on description_1

    expect(page.text).to have_content(description_1)
    expect(page.text).not_to have_content(description_2)
  end
end
