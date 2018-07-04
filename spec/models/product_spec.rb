require 'rails_helper'

describe Product do

  before do
    @product = FactoryBot.create(:product)
    @user = FactoryBot.create(:user)
  end

  context 'when the product has comments' do

    before do
      @product.comments.create!(rating: 1, user: @user, body: "Poor quality!")
      @product.comments.create!(rating: 3, user: @user, body: "Better on recycled paper!")
      @product.comments.create!(rating: 5, user: @user, body: "Danzig!")
    end

    it "returns the average_rating of all comments" do
      expect(@product.average_rating).to eq 3.0
    end

    it "returns the highest rating of all comments" do
      expect(@product.highest_rating_comment.rating).to eq 5
    end

    it "returns the lowest rating of all comments" do
      expect(@product.lowest_rating_comment.rating).to eq 1
    end

  end

  context 'product is created' do

    it "is not valid without a name" do
      expect(Product.new(description: "just another brick in the wall")).not_to be_valid
    end

  end

end
