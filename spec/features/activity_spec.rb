require 'spec_helper'
require 'rails_helper'

feature "setting the goals" do
  before(:each) do
    sign_in_hillary
  end

  let!(:tommy) { FactoryGirl.create(:user) }
  let!(:tommy_goal) { FactoryGirl.create(:activity, name: 'run for president', user_id: User.first.id) }
  let!(:hillary_goal) { FactoryGirl.create(:activity, name: 'beat tommy', user_id: User.find_by(username: "hillary").id) }


  scenario "user can create goal" do
    visit user_url(User.last.id)
    expect(page).to have_content("Create Goal")
  end

  scenario "user can update their own goals" do
    visit user_url(User.find_by(username: "hillary").id)
    expect(page).to have_content("Update Goal")
  end

  scenario "user cannot update someone else's goal" do
    visit user_url(tommy)
    expect(page).to_not have_content("Update Goal")
  end
end

feature "viewing goals" do

  before(:each) do
    sign_in_hillary
  end

  let!(:tommy) { FactoryGirl.create(:user) }
  let!(:tommy_goal) { FactoryGirl.create(:activity, name: 'run for president', user_id: User.first.id) }
  let!(:tommy_private_goal) { FactoryGirl.create(:activity, name: 'run for vice president', user_id: User.first.id, visibility: "private") }

  scenario "user can see all of their own goals"


  scenario "no one else can see a user's private goals" do
    visit user_url(tommy)
    expect(page).to_not have_content("run for vice president")
  end
end

feature "completing the goals" do
  scenario "user can update their own goal from incomplete to complete"
  scenario "user cannot update someone else's goal from incomplete to complete"
end

feature "keeping track of goals" do
  scenario "user can keep track of which goals have been completed"
end
