class Posts::Show < BrowserAction
  route do
    post = PostQuery.find(post_id)

    render Posts::ShowPage, post: post
  end
end
