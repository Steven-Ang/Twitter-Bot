require "rails_helper"

RSpec.describe Tweet, type: :model do

  before(:each) do
    @user = User.create!(name: "Steven", nickname: "ProfessorSpike", email: "steven@gmail.com", password: "hellothere")
    @tweet = Tweet.create!(content: "I'm a very happy person!", user_id: @user.id)
  end

  context "validation" do
    it "should be created with valid inputs" do
      expect(@tweet).to be_valid
    end

    it "should not allow content to be created if the length is over 240 characters" do
      @tweet.content = "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae iure consequuntur asperiores molestiae error maiores recusandae dolores nesciunt distinctio perspiciatis quibusdam id nulla impedit officiis, quia eum porro? Totam cupiditate tempora impedit reprehenderit dolores mollitia quae et velit delectus dolorum eius consectetur quod suscipit, maxime distinctio quis accusantium repellendus praesentium sit. Nam, deleniti delectus nemo itaque dicta temporibus a repellat maiores fugit porro voluptatum ipsa molestias aperiam ullam veritatis officia!"
      expect(@tweet).to_not be_valid
    end

    it "should not allow content to be blank" do
      @tweet.content = ""
      expect(@tweet).to_not be_valid
    end

    it "should not allow content to be nil" do
      @tweet.content = nil
      expect(@tweet).to_not be_valid
    end

  end

  describe "association" do
    it "should have a user" do
      Tweet.reflect_on_association(:user).macro.should   eq(:belongs_to)
    end
  end

  describe "creation" do
    it "should have one item" do
      expect(Tweet.all.count).to eq(1)
    end
  end

end