require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do
  describe "POST #answer" do
    subject { post :answer, id: 1, answer: { answer: "correct" } }

    let(:question)     { double("question") }

    before do
      allow(Question).to receive(:find) { question }
    end

    context "when answer is correct" do
      it "renders correct message" do
        expect(question).to receive(:is_correct?) { true }
        expect(subject.body).to include("Correct")
      end
    end

    context "when answer is wrong" do
      it "renders wrong message" do
        expect(question).to receive(:is_correct?) { false }
        expect(subject.body).to include("Wrong")
      end
    end
  end
end

