class Posts::IndexPage < MainLayout
  def content
    ul class: "posts-list" do
      PostQuery.new.each do |post|
        li post.title, class: "post"
      end
    end
  end
end
