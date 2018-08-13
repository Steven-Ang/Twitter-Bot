require "rails_helper"

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.create!(name: "Steven", nickname: "ProfessorSpike", email: "steven@gmail.com", password: "hellothere")
  end

  describe "validation" do
    it "should let a user be created with valid inputs" do
      expect(@user).to be_valid
    end

    it "should not let a user be created without nickname and name" do
      @user.nickname = nil
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it "should not let a user be created without password" do
      @user.password = nil
      expect(@user).to_not be_valid
    end
  end

  describe "association" do
    it "should have many tweets" do
      User.reflect_on_association(:tweets).macro.should   eq(:has_many)
    end
  end

  describe "creation" do
    it "should have one item" do
      expect(User.all.count).to eq(1)
    end
  end

end