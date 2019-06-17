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

  def page_title
    "Posts"
  end

  private def render_post_list_entry(post)
    div class: "posts-list-post-dates" do
      if post.last_updated
        created = "posted #{formatted_time(post.created_at)}, "
        span created, class: "post-date-created"

        updated = "updated #{formatted_time(post.last_updated.not_nil!)}"
        span updated, class: "post-date-updated"
      else
        created = "posted #{formatted_time(post.created_at)}"
        span created, class: "post-date-created"
      end
    end

    div class: "posts-list-post-title" do
      link post.title, Posts::Show.with(post.slug)
    end

    div class: "posts-list-post-tagline" do
      text post.tagline
    end
  end

  private def formatted_time(time : Time) : String
    time.to_s("%-d %B %Y")
  end
end
