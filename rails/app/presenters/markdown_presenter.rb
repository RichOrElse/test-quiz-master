class MarkdownPresenter
  require 'redcarpet/render_strip'

  TEXT_RENDERER = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
  HTML_RENDERER = Redcarpet::Markdown.new(Redcarpet::Render::HTML)

  attr_reader :to_s, :view

  def initialize to_s, view = NullSanitizer.new
  	@to_s, @view = to_s, view
  end
 
  def to_html
    view.sanitize(HTML_RENDERER.render to_s)
  end

  def to_text
    view.sanitize(TEXT_RENDERER.render to_s)
  end

  class NullSanitizer
  	def sanitize(text)
  	  text
  	end
  end
end