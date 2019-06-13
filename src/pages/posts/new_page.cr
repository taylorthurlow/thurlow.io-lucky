class Posts::NewPage < MainLayout
  needs form : PostForm

  def content
    h1 "New Post"
    render_form(@form)
  end

  private def render_form(f)
    div class: "record-form post-form" do
      form_for Posts::Create do
        field(f.title) { |i| text_input i, autofocus: "true" }
        field(f.tagline) { |i| text_input i }
        field(f.slug) { |i| text_input i }
        field(f.published) { |i| checkbox i }
        field(f.contents) { |i| textarea i }

        submit "Create Post"
      end
    end
  end
end
