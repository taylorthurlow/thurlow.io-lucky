class Posts::Show < BrowserAction
  get "/posts/:post_slug" do
    slug = post_slug.downcase

    if (post = PostQuery.new.slug(slug).first?)
      render Posts::ShowPage, post: post
    else
      render Errors::ShowPage, title: "Post not found", status: 404
    end
  end
end
