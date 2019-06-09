class Posts::IndexPage < MainLayout
  needs posts : PostQuery

  def content
    ul class: "posts-list" do
      @posts.each do |post|
        li post.title, class: "post"
      end
    end
  end
end
