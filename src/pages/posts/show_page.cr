require "markd"

class Posts::ShowPage < MainLayout
  needs post : Post

  def content
    div class: "post-show" do
      div class: "post-title" do
        text @post.title
      end

      div class: "post-tags" do
        tags = @post.tags!.map(&.name)

        ul do
          tags.each do |tag|
            li { text tag }
          end
        end
      end

      div class: "post-contents" do
        options = Markd::Options.new(prettyprint: true)
        raw Markd.to_html(@post.contents, options)
      end
    end

    raw <<-JAVASCRIPT
      <script>
        document.addEventListener("DOMContentLoaded", function() {
          window.setupMediumZoom(".post-contents img");
          PR.prettyPrint();
        });
      </script>
    JAVASCRIPT
  end

  def page_title
    @post.title
  end
end
