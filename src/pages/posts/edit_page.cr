class Posts::EditPage < MainLayout
  include Shared::DatepickerComponent

  needs form : PostForm
  needs post : Post

  def content
    h1 "Edit Post"
    render_form(@form)
  end

  private def render_form(f)
    div class: "record-form post-form" do
      form_for Posts::Update.with(@post) do
        field(f.title) { |i| text_input i, autofocus: "true" }
        field(f.tagline) { |i| text_input i }
        field(f.slug) { |i| text_input i }
        field(f.last_updated) { |i| datetime_picker i }
        field(f.published) { |i| checkbox i }
        field(f.contents) { |i| textarea i }

        setup_time_picker
        submit "Update Post"
      end
    end
  end
end
