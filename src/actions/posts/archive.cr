class Posts::Archive < BrowserAction
  basic_auth

  get "/archive" do
    render ArchivePage, posts: PostQuery.new.created_at.desc_order
  end
end
