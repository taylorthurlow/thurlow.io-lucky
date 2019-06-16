class Posts::Edit < BrowserAction
  get "/posts/:post_slug/edit" do
    slug = post_slug.downcase

    if (post = PostQuery.new.slug(slug).first?)
      render Posts::EditPage, post: post, form: PostForm.new(post)
    else
      render Errors::ShowPage, title: "Post not found", status: 404
    end
  end
end
