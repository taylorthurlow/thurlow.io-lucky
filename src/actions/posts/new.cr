class Posts::New < BrowserAction
  basic_auth

  route do
    render Posts::NewPage, form: PostForm.new
  end
end
