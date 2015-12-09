class MarkdownPresenter < Struct.new(:to_s)
  require 'redcarpet/render_strip'

  TEXT_RENDERER = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
  HTML_RENDERER = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  
  def to_html
    HTML_RENDERER.render to_s
  end

  def to_text
    TEXT_RENDERER.render to_s
  end
end