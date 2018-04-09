module ApplicationHelper

  def form_group_tag(errors, &block)
    css_class = 'form-group'
    content_tag :div, capture(&block), class: css_class
  end
end
