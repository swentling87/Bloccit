require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:sponsored_post) { topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(0..100))}

  it { is_expected.to belong_to(:topic) }

  describe "attributes" do
    it "responds to title" do
      expect(sponsored_post).to respond_to(:title)
    end

    it "responds to body" do
      expect(sponsored_post).to respond_to(:body)
    end

    it "responds to price" do
      expect(sponsored_post).to respond_to(:price)
    end
  end
end
