require 'rails_helper'

describe Comment do

  context "when the comment is created" do

    before do
      @product = FactoryBot.create(:product)
      @user = FactoryBot.create(:user)
    end

    it "creates comment when all params exist/valid" do
      expect(FactoryBot.build(:comment)).to be_valid
      expect(Comment.new(body: 'blah blah blah', rating: 5, user: @user, product: @product)).to be_valid
      expect(Comment.new(body: 'blah blah blah', rating: 5, user: @user)).not_to be_valid
      expect(Comment.new(body: 'blah blah blah', rating: 5, product: @product)).not_to be_valid
      expect(Comment.new(body: 'blah blah blah', user: @user, product: @product)).not_to be_valid
      expect(Comment.new(rating: 5, user: @user, product: @product)).not_to be_valid
    end

    it "is invalid with non-numeric rating" do
      expect(FactoryBot.build(:comment, rating: "five")).not_to be_valid
    end

  end

end
