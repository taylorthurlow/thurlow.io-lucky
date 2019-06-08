class Posts::Create < BrowserAction
  route do
    PostForm.create(params) do |form, post|
      if post
        # post was saved
        render Posts::ShowPage, post: post
      else
        render Posts::NewPage, form: form
      end
    end
  end
end
