class Posts::ArchivePage < MainLayout
  needs posts : PostQuery

  def content
    table id: "posts-archive" do
      thead do
        td "Title"
        td "Pub"
        td "Created"
        td "Updated"
        td ""
      end

      tbody do
        @posts.each do |post|
          tr do
            td do
              link(post.title, Posts::Show.with(post.slug))
            end
            td post.published ? "✓" : ""
            td post.created_at.to_s("%m/%d/%Y")
            td last_updated_string(post)
            td class: "actions" do
              link "", Posts::Edit.with(post.slug), class: "fa fa-pencil"
            end
          end
        end
      end
    end
  end

  def page_title
    "Posts Archive"
  end

  private def last_updated_string(post)
    if post.last_updated
      post.last_updated.not_nil!.to_s("%m/%d/%Y")
    else
      ""
    end
  end
end
