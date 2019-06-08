class Posts::New < BrowserAction
  route do
    render Posts::NewPage, form: PostForm.new
  end
end
