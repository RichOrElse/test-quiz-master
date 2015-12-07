require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do
  describe "POST #answer" do
    subject { post :answer, id: 1, answer: { answer: "correct" } }

    let(:question)     { double("question") }

    before do
      allow(Question).to receive(:find) { question }
    end

    context "when answer is correct" do
      it "redirects to home page with correct answer message" do
        expect(question).to receive(:is_correct?) { true }
        expect(subject).to redirect_to(root_path)
        expect(flash.notice).to eql("Correct answer. Pick another question.")
      end
    end

    context "when answer is wrong" do
      it "renders wrong answer message" do
        expect(question).to receive(:is_correct?) { false }
        expect(subject).to render_template("show")
        expect(flash.notice).to eql("Wrong answer. Try again.")
      end
    end
  end
end

