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

        div class: "date-reset-button" do
          link "Clear Last Updated Value", "#", class: "clear-last-updated"
        end

        raw <<-JAVASCRIPT
          <script>
            document.addEventListener("DOMContentLoaded", function() {
              document.querySelectorAll(".clear-last-updated")[0].onclick = function() {
                document.getElementById("post_last_updated").value = "";
                document.querySelectorAll("input.flatpickr.form-control")[0].value = "";
              };
            });
          </script>
        JAVASCRIPT

        setup_time_picker

        field(f.published) { |i| checkbox i }
        field(f.contents) { |i| textarea i }

        submit "Update Post"
      end
    end
  end
end
