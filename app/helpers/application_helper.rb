module ApplicationHelper

  def form_group_tag(errors, &block)
    css_class = 'form-group'
    content_tag :div, capture(&block), class: css_class
  end

  def markdown(text)
    render_options ={
      prettify:                       true,
      safe_links_only:                true
    }

    extensions = {
      autolink:                       true,
      strikethrough:                  true,
      tables:                         true,
      fenced_code_blocks:             true,
      disable_indented_code_blocks:   true,
      lax_spacing:                    true,
      highlight:                      true,
      quote:                          true
    }
    renderer = Redcarpet::Render::HTML.new(render_options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end


end
