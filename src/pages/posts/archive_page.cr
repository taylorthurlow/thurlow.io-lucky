class Posts::ArchivePage < MainLayout
  needs posts : PostQuery

  def content
    div style: "text-align: center; margin-bottom: 1em;" do
      link "Add a new post", Posts::New
    end

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
              link "", Posts::Delete.with(post.slug), class: "fa fa-trash"
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
