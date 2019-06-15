require "markd"

class Posts::ShowPage < MainLayout
  needs post : Post

  def content
    div class: "post-show" do
      div class: "post-title" do
        text @post.title
      end

      div class: "post-contents" do
        raw Markd.to_html(@post.contents)
      end

      div class: "post-edit" do
        link "edit", Posts::Edit.with(@post)
      end
    end

    raw <<-JAVASCRIPT
      <script>
        document.addEventListener("DOMContentLoaded", function() {
          window.setupMediumZoom(".post-contents img");
        });
      </script>
    JAVASCRIPT
  end
end
