class PostForm < Post::BaseForm
  fillable title, tagline, contents, slug, published, last_updated

  def prepare
    # title
    validate_required title

    # tagline
    validate_required tagline

    # contents
    validate_required contents

    # slug
    validate_required slug
    validate_uniqueness_of slug

    # published
    validate_required published

    # last_updated
  end

  private def validate_slug_format
    if slug.value.match(/&[a-z0-9-]/).nil?
      slug.add_error "must only contain lowercase letters, numbers or '-'"
    end
  end
end
