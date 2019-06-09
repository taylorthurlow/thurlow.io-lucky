abstract class MainLayout
  # Edit shared layout code in src/components/shared/layout.cr
  include Shared::Layout

  def render
    html_doctype

    html lang: "en" do
      shared_layout_head

      body do
        render_header
        render_flash

        div id: "content" do
          content
        end

        render_footer
      end
    end
  end

  private def render_header
    header do
      div id: "header-content" do
        div id: "header-content-left" do
          link "Taylor Thurlow", "/", class: "header-name"
        end

        div id: "header-content-right" do
          link "", "/files/resume.pdf", class: "fa fa-file-text"
          link "", "https://github.com/taylorthurlow", class: "fa fa-lg fa-code-fork"
        end
      end
    end
  end

  private def render_footer
  end
end
