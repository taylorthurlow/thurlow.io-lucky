class TagForm < Tag::BaseForm
  def prepare
    validate_uniqueness_of name
    validate_name_format
  end

  private def validate_name_format
    if name.param.match(/^[a-z0-9 ]+$/).nil?
      name.add_error "must only contain lowercase letters, numbers, or spaces"
    end
  end
end
