class PostForm < Post::BaseForm
  fillable title
  fillable tagline
  fillable contents
  fillable slug
  fillable published
  fillable last_updated
end
