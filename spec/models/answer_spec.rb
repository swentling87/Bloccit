require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) { Question.create!(title: "Question Title", body: "New Question Body", resolved: "Resolved?")}
  let(:answer) { Answer.create!(body: "Answer Body")}

  describe "attributes" do
    it "responds to body" do
      expect(question).to respond_to(:body)
    end
  end
end
