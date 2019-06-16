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
            td post.title
            td post.published
            td post.created_at.to_s("%m/%d/%Y")
            td post.updated_at.to_s("%m/%d/%Y")
            td class: "actions" do
              link "", Posts::Show.with(post.slug), class: "fa fa-eye"
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
end
