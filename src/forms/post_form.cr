class PostForm < Post::BaseForm
  fillable title, tagline, contents, slug, published, last_updated

  virtual all_tags : String

  after_save update_taggings

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

  private def update_taggings(post : Post)
    tag_strings = if all_tags.param
                    all_tags.param.not_nil!.split(",").map(&.strip)
                  else
                    [] of String
                  end

    # Look for tags which were previously associated with the post but are now
    # missing from the provided list. This means that the tag has been removed
    # from the list, and the tagging should be removed from the post.
    post.taggings!.each do |tagging|
      tag = tagging.tag!

      unless tag_strings.includes?(tag.name)
        tagging.delete

        # Now that we've deleted a tagging, let's delete the associated tag if
        # there are no more taggings associated with it (it's unused)
        tag.delete if tag.taggings!.empty?
      end
    end

    # Add any tags which are in our provided list but aren't already associated
    # with the post
    tag_strings.each do |tag_string|
      tag = TagQuery.new.preload_taggings.name(tag_string).first?
      tag = TagForm.create!(name: tag_string) unless tag

      tagging = TaggingQuery.new.tag_id(tag.id).first?
      tagging = TaggingForm.create!(post_id: post.id, tag_id: tag.id) unless tagging
    end
  end
end
