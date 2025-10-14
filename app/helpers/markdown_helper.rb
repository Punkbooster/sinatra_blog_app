require 'commonmarker'
require 'sanitize'

module MarkdownHelper
  def markdown_to_html(markdown)
    return "" if markdown.nil?

    html = Commonmarker.to_html(markdown, plugins: { syntax_highlighter: { theme: "Solarized (dark)" } })

    Sanitize.fragment(html, Sanitize::Config::RELAXED)
  end
end
