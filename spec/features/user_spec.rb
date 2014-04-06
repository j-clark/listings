require 'spec_helper'

feature 'User Management' do
  background { visit root_path }

  scenario 'creating an account' do
    click_on 'Sign up'

    fill_in 'Email', with: 'josh@email.com'
    fill_in 'Password', with: 'password'

    click_on 'Create my account'
  end
end
