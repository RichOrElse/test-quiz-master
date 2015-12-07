require 'rails_helper'

describe QuestionDecorator, :type => :decorator do
  Quiz = Struct.new(:question)
  
  describe '#question' do
    it 'returns italic html' do
      expect(QuestionDecorator.new(Quiz.new "*I am italic*" ).question).to include("<em>I am italic</em>")
    end

    it 'returns bold html' do
      expect(QuestionDecorator.new(Quiz.new "**I am bold**" ).question).to include("<strong>I am bold</strong>")
    end
  end
end
