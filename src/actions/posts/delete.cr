class Posts::Delete < BrowserAction
  basic_auth

  get "/posts/:post_slug/delete" do
    slug = post_slug.downcase

    if (post = PostQuery.new.slug(slug).first?)
      post.delete
      flash.success = "The post was deleted."
      redirect Posts::Archive
    else
      render Errors::ShowPage, title: "Post not found", status: 404
    end
  end
end
