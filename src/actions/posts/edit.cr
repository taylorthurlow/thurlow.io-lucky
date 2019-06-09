class Posts::Edit < BrowserAction
  route do
    post = PostQuery.find(post_id)

    render Posts::EditPage, post: post, form: PostForm.new(post)
  end
end
