require 'rails_helper'

describe Product do

  context "when the product has comments" do
    let(:product) { Product.create!(name: "Misfits poster") }
    let(:user) { User.create!(first_name: "Moopy", last_name: "Mooperson", email: "test@test.com", password: "testicle") }
    before do
      product.comments.create!(rating: 1, user: user, body: "Poor quality!")
      product.comments.create!(rating: 3, user: user, body: "Better on recycled paper!")
      product.comments.create!(rating: 5, user: user, body: "Danzig!")
    end
    it "returns the average rating of all comments" do
      expect(comments.average(:rating)).to eq "3"
    end
  end

  context "product is not valid without a name" do
    it "is not valid without a name" do
      expect(Product.new(description: "just another brick in the wall")).not_to be_valid
    end
  end
  
end
