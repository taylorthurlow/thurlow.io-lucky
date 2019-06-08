class Posts::Index < BrowserAction
  route do
    render IndexPage
  end

  get "/" do
    render IndexPage
  end
end
