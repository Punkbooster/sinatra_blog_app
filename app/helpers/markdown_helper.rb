require 'commonmarker'
require 'sanitize'

module MarkdownHelper
  def markdown_to_html(markdown)
    return "" if markdown.nil?

    html = Commonmarker.to_html(markdown, plugins: { syntax_highlighter: { theme: "base16-eighties.dark" } })

    Sanitize.fragment(html, Sanitize::Config::RELAXED)
  end
end
