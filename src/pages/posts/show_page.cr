class Posts::ShowPage < MainLayout
  needs post : Post

  def content
    para @post.title
    para @post.tagline
    para @post.contents
  end
end
