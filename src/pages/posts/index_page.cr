class Posts::IndexPage < MainLayout
  needs posts : PostQuery

  def content
    div id: "posts-list" do
      @posts.each do |post|
        div class: "posts-list-post" do
          render_post_list_entry(post)
        end
      end
    end
  end

  private def render_post_list_entry(post)
    div class: "posts-list-post-left" do
      div class: "posts-list-post-date" do
        text post.created_at.to_s("%-d %B %Y")
      end
    end

    div class: "posts-list-post-right" do
      div class: "posts-list-post-title" do
        link post.title, Posts::Show.with(post)
      end

      div class: "posts-list-post-tagline" do
        text post.tagline
      end
    end
  end
end
