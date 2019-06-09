class PostForm < Post::BaseForm
  fillable title, tagline, contents, slug, published, last_updated

  def prepare
    validate_uniqueness_of slug
  end

  private def validate_slug_format
    if slug.value.match(/&[a-z0-9-]/).nil?
      slug.add_error "must only contain lowercase letters, numbers or '-'"
    end
  end
end
