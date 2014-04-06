require 'spec_helper'

feature 'Listings' do
  given(:description_1) { 'hamburgers for sale' }
  given(:description_2) { 'hamburgers wanted' }
  given!(:listing) { FactoryGirl.create(:listing, description: description_1) }

  background do
    FactoryGirl.create(:listing, description: description_2)

    visit(listings_path)
  end

  scenario 'viewing all listings' do
    expect(page.text).to have_text(description_1)
  end

  scenario 'clicking a listing and viewing it on its own page' do
    click_on description_1

    expect(page.text).to have_content(description_1)
    expect(page.text).not_to have_content(description_2)
  end

  scenario 'editing an existing listing' do
    visit(listing_path(listing))

    click_on 'Edit this listing'

    fill_in 'Description', with: 'cheeseburgers for sale'
    click_on 'Update Listing'

    expect(page.text).to have_content('cheeseburgers for sale')
    expect(page.text).to have_content('Edit this listing')
  end

  scenario 'creating a new listing' do
    click_on 'Create new listing'

    fill_in 'Description', with: 'Curly fries in park slope'
    click_on 'Create listing'

    expect(page.text).to have_content('Curly fries in park slope')
  end

  scenario 'deleting a listing' do
    expect(page.text).to have_content(listing.description)

    within "#listing-#{listing.id}" do
      click_on 'Delete this listing'
    end

    expect(page.text).to have_content('Create new listing')
    expect(page.text).not_to have_content(listing.description)
  end
end
