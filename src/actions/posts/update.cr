class Posts::Update < BrowserAction
  route do
    post = PostQuery.find(post_id)

    PostForm.update(post, params) do |form, updated_post|
      if form.saved?
        flash.success = "The post was updated."
        redirect to: Posts::Show.with(updated_post)
      else
        render Posts::EditPage, form: form, post: post
      end
    end
  end
end
