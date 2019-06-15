module Shared::Layout
  macro included
    include Lucky::HTMLPage
    include Shared::FieldErrors
    include Shared::FlashMessages
    include Shared::Field
  end

  abstract def content

  def shared_layout_head
    head do
      utf8_charset
      title "thurlow.io - #{page_title}"
      css_link asset("css/app.css")
      js_link asset("js/app.js"), defer: "true"
      csrf_meta_tags
      responsive_meta_tag
    end
  end

  abstract def page_title
end
