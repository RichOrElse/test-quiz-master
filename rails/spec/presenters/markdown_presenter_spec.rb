require 'rails_helper'

describe MarkdownPresenter, :type => :presenter do
  subject { MarkdownPresenter.new("*This is italic.* **This is bold.**") }
  
  describe '#to_html' do
    it 'returns italic html' do
      expect(subject.to_html).to include("<em>This is italic.</em>")
    end

    it 'returns bold html' do
      expect(subject.to_html).to include("<strong>This is bold.</strong>")
    end
  end

  describe '#to_text' do
    it 'returns plain text with no markdown' do
      expect(subject.to_text).to include("This is italic. This is bold.")
    end
  end
end
