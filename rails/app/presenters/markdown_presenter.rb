class MarkdownPresenter
  require 'redcarpet/render_strip'

  TEXT_RENDERER = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
  HTML_RENDERER = Redcarpet::Markdown.new(Redcarpet::Render::HTML)

  def initialize markdown, sanitizer = NullSanitizer.new
    @markdown, @view = markdown, sanitizer
  end
 
  def to_html
    @view.sanitize(HTML_RENDERER.render @markdown)
  end

  def to_text
    @view.sanitize(TEXT_RENDERER.render @markdown)
  end

  def to_s
  	@markdown
  end

  class NullSanitizer
    def sanitize(text)
      text
    end
  end
end