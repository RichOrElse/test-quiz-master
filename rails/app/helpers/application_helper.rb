module ApplicationHelper
  def present_markdown(markdown)
    MarkdownPresenter.new(markdown, self)
  end
end
