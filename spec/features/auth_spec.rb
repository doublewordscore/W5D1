require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New User!"
  end
end

feature "signing up a user" do
  before(:each) do
    create_hillary
  end
  scenario "shows username on the homepage after signup" do
    visit users_url
    expect(page).to have_content "hillary"
  end

end

feature "logging in" do
  before(:each) do
    sign_in_hillary
  end

  scenario "shows username on the homepage after login" do
    visit users_url
    expect(page).to have_content "hillary"
  end

end

feature "logging out" do
  before(:each) do
    sign_in_hillary
    sign_out_hillary
  end

  scenario "begins with a logged out state" do
    visit new_session_url
    expect(page).to_not have_content "Log Out"
  end

  scenario "doesn't show username on the homepage after logout" do
    visit users_url
    expect(page).to_not have_content "hillary"
  end

end
