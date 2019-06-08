class Posts::NewPage < MainLayout
  needs form : PostForm

  def content
    h1 "New Post"
    render_form(@form)
  end

  private def render_form(f)
    form_for Posts::Create do
      post_fields(f)

      submit "Create Post"
    end
  end

  private def post_fields(f)
    field(f.title) { |i| text_input i, autofocus: "true" }

    field(f.tagline) { |i| text_input i }

    field(f.slug) { |i| text_input i }

    field(f.contents) { |i| text_input i }

    label_for f.published
    checkbox(f.published, value: "true")
  end
end
