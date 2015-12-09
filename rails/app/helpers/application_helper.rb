module ApplicationHelper
  def from_markdown(markdown)
  	MarkdownPresenter.new(markdown, self)
  end
end
