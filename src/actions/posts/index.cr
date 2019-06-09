class Posts::Index < BrowserAction
  route do
    render_index_page
  end

  get "/" do
    render_index_page
  end

  private def render_index_page
    render IndexPage, posts: PostQuery.new.published(true).created_at.desc_order
  end
end
