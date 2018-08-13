require "rails_helper"

feature "Create Tweet", type: :feature do

  before(:each) do
    @user = User.create!(name: "Steven", nickname: "ProfessorSpike", email: "steven@gmail.com", password: "hellothere")
    visit sign_in_path
    fill_in "email", with: "steven@gmail.com"
    fill_in "password", with: "hellothere"
    click_on "Submit"
  end

  it "should create a tweet" do
    visit "/"
    expect(page).to have_content "Twitter Bot"
    click_button "Schedule Tweet"
    fill_in "tweet[content]", with: "I'm a very happy person!"
    click_button "Schedule"
    expect(page).to have_content "My Tweets"
  end
  
end