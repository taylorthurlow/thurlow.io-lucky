class PostForm < Post::BaseForm
  fillable title, tagline, contents, slug, published, last_updated

  def prepare
    validate_uniqueness_of slug
    validate_slug_format

    allow_empty_last_updated
  end

  private def validate_slug_format
    if slug.param.match(/^[a-z0-9-]+$/).nil?
      slug.add_error "must only contain lowercase letters, numbers, or '-'."
    end
  end

  private def allow_empty_last_updated
    if last_updated.param.blank?
      last_updated.reset_errors
      last_updated.value = nil
    end
  end
end
