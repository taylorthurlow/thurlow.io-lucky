class Posts::EditPage < MainLayout
  needs form : PostForm
  needs post : Post

  def content
    h1 "Edit Post"
    render_form(@form)
  end

  private def render_form(f)
    form_for Posts::Update.with(@post) do
      field(f.title) { |i| text_input i, autofocus: "true" }
      field(f.tagline) { |i| text_input i }
      field(f.slug) { |i| text_input i }
      field(f.contents) { |i| textarea i }
      field(f.published) { |i| checkbox i }
      # field(f.last_updated) do |i|
      #   # input({"type" => "date", "value" => i.value.to_s || ""})
      #   text_input i, type: "date"
      # end

      submit "Update Post"
    end
  end
end
